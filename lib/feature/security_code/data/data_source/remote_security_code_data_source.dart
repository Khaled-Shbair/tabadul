import '/config/all_imports.dart';

abstract class RemoteSecurityCodeDataSource {
  Future<SendSecurityCodeResponse> sendSecurityCode(
      SendSecurityCodeRequest request);

  Future<VerifySecurityCodeResponse> verifySecurityCode(
      VerifySecurityCodeRequest request);
}

class RemoteSecurityCodeDataSourceImpl extends RemoteSecurityCodeDataSource {
  final FbAuthController _firebaseAuth;
  final FbFirestoreController _firestore;

  RemoteSecurityCodeDataSourceImpl(this._firebaseAuth, this._firestore);

  @override
  Future<SendSecurityCodeResponse> sendSecurityCode(request) async {
    return await _firebaseAuth.sendSecurityCode(
      request.phoneNumber,
      resendToken: request.resendToken,
    );
  }

  @override
  Future<VerifySecurityCodeResponse> verifySecurityCode(request) async {
    _firestore.getUserData(request.phoneNumber);
    var result = await _firebaseAuth.verifySecurityCode(
      request.securityCode,
      request.verificationId,
    );
    UserModel? userData;
    if (result.status == true) {
      userData = await _firestore.getUserData(request.phoneNumber);
    }

    return VerifySecurityCodeResponse(
      status: result.status,
      userData: userData,
    );
  }
}
