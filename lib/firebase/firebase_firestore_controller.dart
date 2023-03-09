import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tabadul/models/user_model.dart';
import '../models/product_model.dart';
import '../constants/tables.dart';

class FbFirestoreController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(String id, UserModel user) async {
    await _firestore.collection(usersTable).doc(id).set(user.toMap());
  }

  Future<void> getUserData(
    String id, {
    required Function(DocumentSnapshot<Map<String, dynamic>>) then,
    required Function(Object) catchError,
  }) async {
    await _firestore
        .collection(usersTable)
        .doc(id)
        .get()
        .then(then)
        .catchError(catchError);
  }

  Future<void> getCities({
    required Function(QuerySnapshot<Map<String, dynamic>>) then,
    required Function(Object) catchError,
  }) async {
    await _firestore
        .collection(citiesTable)
        .get()
        .then(then)
        .catchError(catchError);
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
