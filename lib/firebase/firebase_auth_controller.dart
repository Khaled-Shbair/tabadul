import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../shared_preference/pref_controller.dart';

class FbAuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(String phoneNumber,
      {required Function(void value) then}) async {
    await _auth
        .verifyPhoneNumber(
          phoneNumber: '+97$phoneNumber',
          timeout: const Duration(seconds: 30),
          verificationCompleted: (PhoneAuthCredential credential) async {
           // await _signIn(credential.);
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
    try {
      await _auth.checkActionCode(code);
      return true;
    }  catch (e) {
      Get.snackbar(e.toString(), '');
      print(e.toString());
      return false;
    }

    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //verificationId: PrefController().verificationId,
    //smsCode: code,
    //);
    //print(credential.smsCode);

    //if (credential.smsCode == code) {
    //  //   await _signIn(credential);
    //  return true;
    //} else {
    //  return false;
    //}
  }

  Future<void> _signIn(String phoneNumber) async {
    try {
      ConfirmationResult confirmationResult = await _auth.signInWithPhoneNumber(phoneNumber);
      UserCredential userCredential = await confirmationResult.confirm('123456');

      //if (userCredential.user != null) {
      //  Get.to(AllPages());
      //}
    } catch (error) {
      //
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = _auth.currentUser!;
    return firebaseUser;
  }
}
