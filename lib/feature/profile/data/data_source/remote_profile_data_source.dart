import '/config/all_imports.dart';

abstract class RemoteProfileDataSource {
  Future<EditProfileResponse> editProfile(EditProfileRequest request);

  Future<String?> editImageProfile(File image, String phoneNumber);

  Future<CitiesModel> getCities();

  Future<RegionsModel> getRegions();
}

class RemoteProfileDataSourceImpl extends RemoteProfileDataSource {
  final FbFirestoreController _firestore;
  final FirebaseStorageController _storage;

  RemoteProfileDataSourceImpl(this._firestore, this._storage);

  @override
  Future<String?> editImageProfile(File image, String phoneNumber) async {
    return await _storage.uploadImageToFirebase(image, phoneNumber);
  }

  @override
  Future<EditProfileResponse> editProfile(request) async {
    return await _firestore.editProfile(request);
  }

  @override
  Future<CitiesModel> getCities() async {
    return await _firestore.getCities();
  }

  @override
  Future<RegionsModel> getRegions() async {
    return await _firestore.getRegions();
  }
}
