import '/config/all_imports.dart';

class FbAuthController {
  final FirebaseAuth _auth;

  FbAuthController(this._auth);

  Future<SendSecurityCodeResponse> sendSecurityCode(
    String phoneNumber, {
    int? resendToken,
  }) async {
    Completer<SendSecurityCodeResponse> completer = Completer();
    await _auth.verifyPhoneNumber(
      phoneNumber: '+97$phoneNumber',
      timeout: Duration(seconds: AppConstants.timeoutVerifyPhoneNumber),
      verificationCompleted: (PhoneAuthCredential credential) async {},
      codeSent: (String verificationId, int? resendToken) {
        completer.complete(
          SendSecurityCodeResponse(
            verificationId: verificationId,
            resendToken: resendToken,
            status: true,
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationFailed: (FirebaseAuthException error) {},
      forceResendingToken: resendToken,
    );

    return completer.future;
  }

  Future<VerifySecurityCodeResponse> verifySecurityCode(
      String code, String verificationId) async {
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
    } on FirebaseAuthException {
      debugPrint('FirebaseAuthException');
    } catch (e) {
      debugPrint('catch');
    }
    return result;
  }

  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  // User getLoggedInUser() {
  //   User firebaseUser = _auth.currentUser!;
  //   return firebaseUser;
  // }
}
