import '/config/all_imports.dart';

abstract class RemoteAddPersonalInformationDataSource {
  Future<AddPersonalInformationResponse> addPersonalInformation(
      AddPersonalInformationRequest request);

  Future<CitiesResponse> getCities();

  Future<RegionsResponse> getRegions();
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
  Future<CitiesResponse> getCities() async {
    return await _firestore.getCities();
  }

  @override
  Future<RegionsResponse> getRegions() async {
    return await _firestore.getRegions();
  }
}
