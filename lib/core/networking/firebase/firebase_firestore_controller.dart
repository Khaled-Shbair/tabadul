import '/config/all_imports.dart';

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

  Future<EditProfileResponse> editProfile(EditProfileRequest request) async {
    try {
      await _firestore
          .collection(FirebaseConstants.usersTable)
          .doc(request.phoneNumber)
          .update(request.toMap());
      return EditProfileResponse(status: true);
    } catch (e) {
      return EditProfileResponse(status: false, error: e.toString());
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

  Future<UserModel?> getUserData(String phoneNumber) async {
    var snapshot = await _firestore
        .collection(FirebaseConstants.usersTable)
        .doc(phoneNumber)
        .get();
    if (snapshot.exists && snapshot.data() != null) {
      return UserModel.formMap(snapshot.data()!);
    } else {
      return null;
    }
  }

  Future<CitiesModel> getCities() async {
    try {
      var snapshot =
          await _firestore.collection(FirebaseConstants.citiesTable).get();
      if (snapshot.docs.isNotEmpty) {
        List<CityModel> cities =
            snapshot.docs.map((doc) => CityModel.fromMap(doc.data())).toList();

        return CitiesModel(cities: cities);
      } else {
        throw Exception(ManagerStrings.noData);
      }
    } catch (e) {
      throw Exception(ManagerStrings.oopsThereIsSomethingWrong);
    }
  }

  Future<RegionsModel> getRegions() async {
    try {
      var snapshot =
          await _firestore.collection(FirebaseConstants.regionsTable).get();
      if (snapshot.docs.isNotEmpty) {
        List<RegionModel> regions = snapshot.docs
            .map((doc) => RegionModel.fromMap(doc.data()))
            .toList();

        return RegionsModel(regions: regions);
      } else {
        throw Exception(ManagerStrings.noData);
      }
    } catch (e) {
      throw Exception(ManagerStrings.oopsThereIsSomethingWrong);
    }
  }

  Future<NotificationsResponse> getNotifications(
    String id,
    DocumentSnapshot? lastDocument,
  ) async {
    try {
      var query = _firestore
          .collection(FirebaseConstants.usersTable)
          .doc(id)
          .collection(FirebaseConstants.notificationsTable)
          .orderBy(FirebaseConstants.createdAt, descending: true)
          .limit(15);
      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }
      var snapshot = await query.get();
      if (snapshot.docs.isNotEmpty) {
        List<NotificationResponse> notifications = snapshot.docs
            .map((doc) => NotificationResponse.fromMap(doc.data(), doc.id))
            .toList();
        return NotificationsResponse(notifications,
            snapshot.docs.isNotEmpty ? snapshot.docs.last : null);
      } else {
        return NotificationsResponse([]);
      }
    } catch (e) {
      throw Exception(ManagerStrings.oopsThereIsSomethingWrong);
    }
  }

  Future<ProductsResponse> getProducts(
    String departmentName,
    DocumentSnapshot? lastDocument,
  ) async {
    try {
      var query = _firestore
          .collection(departmentName)
          .orderBy(FirebaseConstants.createdAt, descending: true)
          .limit(15);

      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }

      var snapshot = await query.get();
      debugPrint('Fetched ${snapshot.docs.length} products');

      if (snapshot.docs.isNotEmpty) {
        List<ProductResponse> products = snapshot.docs
            .map((doc) => ProductResponse.fromMap(doc.data()))
            .toList();

        return ProductsResponse(
          lastDocument: snapshot.docs.last,
          message: ManagerStrings.successfully,
          status: true,
          products: products,
        );
      } else {
        return ProductsResponse(
          message: ManagerStrings.noMore,
          status: false,
          products: [],
        );
      }
    } catch (e) {
      throw Exception(ManagerStrings.oopsThereIsSomethingWrong);
    }
  }

  Future<AddProductResponse> addProduct(AddProductRequest product) async {
    try {
      await _firestore
          .collection(product.tableName)
          .doc()
          .set(product.toJson());
      return AddProductResponse(
          message: ManagerStrings.successfully, status: true);
    } catch (e) {
      return AddProductResponse(
          message: ManagerStrings.badRequest, status: false);
    }
  }
}
