import '../shared_preference/pref_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class FbAuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(String phoneNumber,
      {required Function(void value) then}) async {
    await _auth
        .verifyPhoneNumber(
          phoneNumber: '+97$phoneNumber',
          timeout: const Duration(seconds: 30),
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _signIn(credential);
          },
          codeSent: (String verificationId, int? resendToken) {
            PrefController().verificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            PrefController().verificationId = verificationId;
          },
          verificationFailed: (FirebaseAuthException error) {},
        )
        .then(then);
  }

  Future<bool> submitOTP(String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: PrefController().verificationId,
      smsCode: code,
    );

    bool result = await _signIn(credential);
    return result;
  }

  Future<bool> _signIn(AuthCredential credential) async {
    bool result = false;
    try {
      UserCredential user = await _auth.signInWithCredential(credential);
      if (user.user != null) {
        result = true;
        PrefController().login = true;
      }
    } catch (e) {
      result = false;
    }
    return result;
  }

  Future<void> logOut() async {
    await _auth.signOut();
    PrefController().login = false;
  }

  User getLoggedInUser() {
    User firebaseUser = _auth.currentUser!;
    return firebaseUser;
  }
}
