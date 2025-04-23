import 'dart:async';

import '/config/all_imports.dart';

class FbAuthController {
  final FirebaseAuth _auth;

  FbAuthController(this._auth);

  Future<SendSecurityCodeResponse> sendSecurityCode(
    String phoneNumber,
  ) async {
    Completer<SendSecurityCodeResponse> completer = Completer();
    await _auth.verifyPhoneNumber(
      phoneNumber: '+97$phoneNumber',
      timeout: Duration(seconds: AppConstants.timeoutVerifyPhoneNumber),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _signIn(credential);
      },
      codeSent: (String verificationId, int? resendToken) {
        completer
            .complete(SendSecurityCodeResponse(verificationId: verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        completer
            .complete(SendSecurityCodeResponse(verificationId: verificationId));
      },
      verificationFailed: (FirebaseAuthException error) {
      },
    );
    return completer.future;
  }

  Future<VerifySecurityCodeResponse> verifySecurityCode(
    String code,
    String verificationId,
  ) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: code,
    );

    bool result = await _signIn(credential);
    return VerifySecurityCodeResponse(status: result);
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

  Future<void> logout() async => await _auth.signOut();

  User getLoggedInUser() {
    User firebaseUser = _auth.currentUser!;
    return firebaseUser;
  }
}
