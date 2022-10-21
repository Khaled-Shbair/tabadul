import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Screen/Main_Screen.dart';

class PhoneAuthBloc extends GetxController {
  late String _verificationId;
  var authState = ''.obs;
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

  Future<void> submitPhoneNumbers(String phoneNumber) async {
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

  void _codeSent(String verificationId, int? resendToken) {
    _verificationId = verificationId;
    authState.value = 'Login ture';
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    _verificationId = verificationId;
  }

  void _verificationFailed(FirebaseAuthException error) {}

  Future<void> submitOTP(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );
    await _signIn(credential);
  }

  Future<void> _signIn(PhoneAuthCredential credential) async {
    try {
      var userCredential = await _firebaseAuth.signInWithCredential(credential);
      if (userCredential.user != null) {
        Get.to(const MainScreen());
      }
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
