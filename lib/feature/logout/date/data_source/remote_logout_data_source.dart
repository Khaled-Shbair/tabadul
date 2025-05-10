import '/config/all_imports.dart';

abstract class RemoteLogoutDataSource {
  Future<bool> logout();
}

class RemoteLogoutDataSourceImpl extends RemoteLogoutDataSource {
  final FbAuthController _firebaseAuth;

  RemoteLogoutDataSourceImpl(this._firebaseAuth);

  @override
  Future<bool> logout() async {
    return await _firebaseAuth.logout();
  }
}
