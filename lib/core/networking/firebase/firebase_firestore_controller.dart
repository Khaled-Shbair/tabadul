import 'package:tabadul/feature/add_personal_information/data/response/cities_response.dart';

import '/config/all_imports.dart';

import '../../../config/constants/tables.dart';
import '../../../models/product_model.dart';

class FbFirestoreController {
  final FirebaseFirestore _firestore;

  FbFirestoreController(this._firestore);

  Future<AddPersonalInformationResponse> createUser(
      String id, AddPersonalInformationRequest request) async {
    try {
      await _firestore
          .collection(FirebaseConstants.usersTable)
          .doc(id)
          .set(request.toMap());
      return AddPersonalInformationResponse(status: true);
    } catch (e) {
      return AddPersonalInformationResponse(
        status: false,
        error: e.toString(),
      );
    }
  }

  Future<AuthResponse> isUserExists(String phoneNumber) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection(FirebaseConstants.usersTable)
          .doc(phoneNumber)
          .get();
      return AuthResponse(isExists: snapshot.exists);
    } catch (e) {
      return AuthResponse(isExists: false);
    }
  }

  Future<AuthResponse?> getUserData(String phoneNumber) async {
    var snapshot = await _firestore
        .collection(FirebaseConstants.usersTable)
        .doc(phoneNumber)
        .get();
    if (snapshot.exists && snapshot.data() != null) {
      // return AuthResponse.fromMap(snapshot.data()!);
    } else {
      return null;
    }
  }

  Future<CitiesResponse> getCities() async {
    try {
      var snapshot =
          await _firestore.collection(FirebaseConstants.citiesTable).get();
      if (snapshot.docs.isNotEmpty) {
        List<CityResponse> cities = snapshot.docs
            .map((doc) => CityResponse.fromMap(doc.data()))
            .toList();

        return CitiesResponse(cities: cities);
      } else {
        throw Exception(ManagerStrings.noData);
      }
    } catch (e) {
      throw Exception(ManagerStrings.oopsThereIsSomethingWrong);
    }
  }

  Future<RegionsResponse> getRegions() async {
    try {
      var snapshot =
          await _firestore.collection(FirebaseConstants.regionsTable).get();
      if (snapshot.docs.isNotEmpty) {
        List<RegionResponse> regions = snapshot.docs
            .map((doc) => RegionResponse.fromMap(doc.data()))
            .toList();

        return RegionsResponse(regions: regions);
      } else {
        throw Exception(ManagerStrings.noData);
      }
    } catch (e) {
      throw Exception(ManagerStrings.oopsThereIsSomethingWrong);
    }
  }

  Future<void> addToFurnitureDepartment(ProductModel product) async {
    await _firestore.collection(furnitureDepartmentTable).add(product.toMap());
  }

  Future<void> getFurnitureDepartment({
    required Function(QuerySnapshot<Map<String, dynamic>>) then,
    required Function(Object) catchError,
  }) async {
    await _firestore
        .collection(furnitureDepartmentTable)
        .get()
        .then(then)
        .catchError(catchError);
  }

  Future<void> addToCarpetsAndMattressesDepartment(ProductModel product) async {
    await _firestore
        .collection(carpetsAndMattressesDepartmentTable)
        .add(product.toMap());
  }

  Future<void> getCarpetsAndMattressesDepartment({
    required Function(QuerySnapshot<Map<String, dynamic>>) then,
    required Function(Object) catchError,
  }) async {
    await _firestore
        .collection(carpetsAndMattressesDepartmentTable)
        .get()
        .then(then)
        .catchError(catchError);
  }

  Future<void> addToPhoneDepartment(ProductModel product) async {
    await _firestore.collection(phoneDepartmentTable).add(product.toMap());
  }

  Future<void> getPhoneDepartment({
    required Function(QuerySnapshot<Map<String, dynamic>>) then,
    required Function(Object) catchError,
  }) async {
    await _firestore
        .collection(phoneDepartmentTable)
        .get()
        .then(then)
        .catchError(catchError);
  }

  Future<void> addToComputerDepartment(ProductModel product) async {
    await _firestore.collection(computerDepartmentTable).add(product.toMap());
  }

  Future<void> getComputerDepartment({
    required Function(QuerySnapshot<Map<String, dynamic>>) then,
    required Function(Object) catchError,
  }) async {
    await _firestore
        .collection(computerDepartmentTable)
        .get()
        .then(then)
        .catchError(catchError);
  }

  Future<void> addToMotorcycleDepartment(ProductModel product) async {
    await _firestore.collection(motorcycleDepartmentTable).add(product.toMap());
  }

  Future<void> getMotorcycleDepartment({
    required Function(QuerySnapshot<Map<String, dynamic>>) then,
    required Function(Object) catchError,
  }) async {
    await _firestore
        .collection(motorcycleDepartmentTable)
        .get()
        .then(then)
        .catchError(catchError);
  }

  Future<void> addToBicycleDepartment(ProductModel product) async {
    await _firestore.collection(bicycleDepartmentTable).add(product.toMap());
  }

  Future<void> getBicycleDepartment({
    required Function(QuerySnapshot<Map<String, dynamic>>) then,
    required Function(Object) catchError,
  }) async {
    await _firestore
        .collection(bicycleDepartmentTable)
        .get()
        .then(then)
        .catchError(catchError);
  }

  Future<void> addToCarDepartment(ProductModel product) async {
    await _firestore.collection(carDepartmentTable).add(product.toMap());
  }

  Future<void> getCarDepartment({
    required Function(QuerySnapshot<Map<String, dynamic>>) then,
    required Function(Object) catchError,
  }) async {
    await _firestore
        .collection(carDepartmentTable)
        .get()
        .then(then)
        .catchError(catchError);
  }

  Future<void> addToElectricMachinesDepartment(ProductModel product) async {
    await _firestore
        .collection(electricMachinesDepartmentTable)
        .add(product.toMap());
  }

  Future<void> getElectricMachinesDepartment({
    required Function(QuerySnapshot<Map<String, dynamic>>) then,
    required Function(Object) catchError,
  }) async {
    await _firestore
        .collection(electricMachinesDepartmentTable)
        .get()
        .then(then)
        .catchError(catchError);
  }
}
