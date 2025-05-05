import '/config/all_imports.dart';

abstract class RemoteAuthDataSource {
  Future<AuthResponse> login(AuthRequest request);

  Future<AuthResponse> createAccount(AuthRequest request);
}

class RemoteAuthDataSourceImpl extends RemoteAuthDataSource {
  final FbFirestoreController _fbFirestore;

  RemoteAuthDataSourceImpl(this._fbFirestore);

  @override
  Future<AuthResponse> login(request) async {
    return await _fbFirestore.isUserExists(request.phoneNumber);
  }

  @override
  Future<AuthResponse> createAccount(request) async {
    return await _fbFirestore.isUserExists(request.phoneNumber);
  }
}
