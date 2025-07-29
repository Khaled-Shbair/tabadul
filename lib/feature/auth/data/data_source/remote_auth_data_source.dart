import '/config/all_imports.dart';

abstract class RemoteAuthDataSource {
  Future<AuthResponse> login(AuthRequest request);

  Future<AuthResponse> createAccount(AuthRequest request);
  Future<SendSecurityCodeResponse> sendSecurityCode(
      SendSecurityCodeRequest request);

  Future<VerifySecurityCodeResponse> verifySecurityCode(
      VerifySecurityCodeRequest request);
  Future<bool> logout();
}

class RemoteAuthDataSourceImpl extends RemoteAuthDataSource {
  RemoteAuthDataSourceImpl(this._fbFirestore, this._firebaseAuth);
  final FbFirestoreController _fbFirestore;
  final FbAuthController _firebaseAuth;
  @override
  Future<AuthResponse> login(request) async {
    return await _fbFirestore.isUserExists(request.phoneNumber);
  }

  @override
  Future<AuthResponse> createAccount(request) async {
    return await _fbFirestore.isUserExists(request.phoneNumber);
  }

  @override
  Future<bool> logout() async {
    return await _firebaseAuth.logout();
  }

  @override
  Future<SendSecurityCodeResponse> sendSecurityCode(request) async {
    return await _firebaseAuth.sendSecurityCode(
      request.phoneNumber,
      resendToken: request.resendToken,
    );
  }

  @override
  Future<VerifySecurityCodeResponse> verifySecurityCode(request) async {
    _fbFirestore.getUserData(request.phoneNumber);
    var result = await _firebaseAuth.verifySecurityCode(
      request.securityCode,
      request.verificationId,
    );
    UserModel? userData;
    if (result.status == true) {
      userData = await _fbFirestore.getUserData(request.phoneNumber);
    }

    return VerifySecurityCodeResponse(
      status: result.status,
      userData: userData,
    );
  }
}
