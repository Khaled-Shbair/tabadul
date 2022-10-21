import 'package:firebase_auth/firebase_auth.dart';


class PhoneAuthBloc{
  late String _verificationId;
  late final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> submitPhoneNumber(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+97$phoneNumber',
      timeout: const Duration(seconds: 10),
      verificationCompleted: _verificationCompleted,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
  }

  void _verificationCompleted(PhoneAuthCredential credential) async {
    await _signIn(credential);
  }

  void _verificationFailed(FirebaseAuthException error) {
  }

  void _codeSent(String verificationId, int? resendToken) {
    _verificationId = verificationId;
  }

  void _codeAutoRetrievalTimeout(String verificationId) {}

  Future<void> submitOTP(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );

    await _signIn(credential);
  }

  Future<void> _signIn(PhoneAuthCredential credential) async {
    try {
      await _firebaseAuth.signInWithCredential(credential);
    } catch (error) {
      //
    }
  }

  Future<void> logOut() async => await _firebaseAuth.signOut();

  User getLoggedInUser() {
    User firebaseUser = _firebaseAuth.currentUser!;
    return firebaseUser;
  }
}
