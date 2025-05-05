import '/config/all_imports.dart';

abstract class RemoteSecurityCodeDataSource {
  Future<SendSecurityCodeResponse> sendSecurityCode(
      SendSecurityCodeRequest request);

  Future<VerifySecurityCodeResponse> verifySecurityCode(
      VerifySecurityCodeRequest request);
}

class RemoteSecurityCodeDataSourceImpl extends RemoteSecurityCodeDataSource {
  final FbAuthController _firebaseAuth;

  RemoteSecurityCodeDataSourceImpl(this._firebaseAuth);

  @override
  Future<SendSecurityCodeResponse> sendSecurityCode(request) async {
    return await _firebaseAuth.sendSecurityCode(
      request.phoneNumber,
      resendToken: request.resendToken,
    );
  }

  @override
  Future<VerifySecurityCodeResponse> verifySecurityCode(request) async {
    return await _firebaseAuth.verifySecurityCode(
      request.securityCode,
      request.verificationId,
    );
  }
}
