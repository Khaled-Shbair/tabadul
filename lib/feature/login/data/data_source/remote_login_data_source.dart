import '/config/all_imports.dart';

abstract class RemoteLoginDataSource {
  Future<LoginResponse> login(LoginRequest request);
}

class RemoteLoginDataSourceImpl extends RemoteLoginDataSource {
  final FbFirestoreController _fbFirestore;

  RemoteLoginDataSourceImpl(this._fbFirestore);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    var response = await _fbFirestore.getUserData(request.phoneNumber);
    if (response != null) {
      return response;
    } else {
      throw Exception(ManagerStrings.userNotRegistered);
    }
  }
}
