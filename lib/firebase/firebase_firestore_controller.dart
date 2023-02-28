import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tabadul/models/user.dart';
import '../constants/tables.dart';

class FbFirestoreController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(String id, User user) async {
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

  Future<void> getCities(String id) async {
    await _firestore.collection(citiesTable).get();
  }
}
