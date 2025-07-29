import '/config/all_imports.dart';

abstract class RemoteAddPersonalInformationDataSource {
  Future<AddPersonalInformationResponse> addPersonalInformation(
      AddPersonalInformationRequest request);

  Future<CitiesModel> getCities();

  Future<RegionsModel> getRegions();
}

class RemoteAddPersonalInformationDataSourceImpl
    extends RemoteAddPersonalInformationDataSource {
  final FbFirestoreController _firestore;

  RemoteAddPersonalInformationDataSourceImpl(this._firestore);

  @override
  Future<AddPersonalInformationResponse> addPersonalInformation(request) async {
    return await _firestore.createUser(request.phoneNumber, request);
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
