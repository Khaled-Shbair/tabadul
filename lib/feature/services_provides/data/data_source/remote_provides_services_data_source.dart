import '/config/all_imports.dart';

abstract class RemoteProvidesServicesDataSource {
  Future<RegisterAsServiceProvideResponse> registerAsServiceProvide(
      UserModel request);
  Future<String?> addImageServiceProvide(File image, String phoneNumber);
  Future<EditProfileResponse> editProfileProvideService(UserModel request);
}

class RemoteProvidesServicesDataSourceImpl
    extends RemoteProvidesServicesDataSource {
  RemoteProvidesServicesDataSourceImpl(this._firestore, this._storage);
  final FbFirestoreController _firestore;
  final FirebaseStorageController _storage;

  @override
  Future<String?> addImageServiceProvide(File image, String phoneNumber) async {
    return await _storage.uploadImageToFirebase(
        image, FirebaseConstants.profileImages, phoneNumber);
  }

  @override
  Future<RegisterAsServiceProvideResponse> registerAsServiceProvide(
      request) async {
    return await _firestore.registerAsServiceProvide(request);
  }

  @override
  Future<EditProfileResponse> editProfileProvideService(
      UserModel request) async {
    return await _firestore.editProfile(request);
  }
}
