import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/routes.dart';
import '../firebase/firebase_firestore_controller.dart';
import '../models/City.dart';
import '../models/user.dart';

class AddInformationGetxController extends GetxController {
  static AddInformationGetxController get to => Get.find();
  final FbFirestoreController _firestore = FbFirestoreController();
  List<City> city = <City>[
    City(nameAr: 'غزة', id: 1),
    City(nameAr: 'خانيونس', id: 2),
    City(nameAr: 'رفع', id: 3),
    City(nameAr: 'النصيرات', id: 4),
    City(nameAr: 'دير البلح', id: 5),
    City(nameAr: 'المغازي', id: 6),
    City(nameAr: 'الزهرة', id: 7),
  ];
  List<City> area = <City>[
    City(nameAr: 'غزة', id: 1),
    City(nameAr: 'خانيونس', id: 2),
    City(nameAr: 'رفع', id: 3),
    City(nameAr: 'النصيرات', id: 4),
    City(nameAr: 'دير البلح', id: 5),
    City(nameAr: 'المغازي', id: 6),
    City(nameAr: 'الزهرة', id: 7),
  ];
  String? _selectedCityId;
  String? _selectedAreaId;
  late TextEditingController _firstName;
  late TextEditingController _lastName;

  TextEditingController get firstName => _firstName;

  String? get selectedCityId => _selectedCityId;

  String? get selectedAreaId => _selectedAreaId;

  TextEditingController get lastName => _lastName;

  @override
  void onInit() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    _firstName.dispose();
    _lastName.dispose();
    super.onClose();
  }

  void selectedCity(String value) {
    _selectedCityId = value;
    update();
  }

  void selectedArea(String value) {
    _selectedAreaId = value;
    update();
  }

  Future<void> createUser({
    required String phone,
  }) async {
    if (_firstName.text.isNotEmpty &&
        _lastName.text.isNotEmpty &&
        _selectedAreaId!.isNotEmpty &&
        _selectedCityId!.isNotEmpty) {
      User user = User(
        image:
            'https://firebasestorage.googleapis.com/v0/b/tabadul-34a2c.appspot.com/o/user.png?alt=media&token=bbae8920-b1ee-47be-b8d7-2af1e7187cee',
        id: phone,
        phone: phone,
        firstName: _firstName.text,
        lastName: _lastName.text,
        city: city[int.parse(_selectedCityId!)].nameAr,
        street: area[int.parse(_selectedAreaId!)].nameAr,
      );
      await _firestore.createUser(phone, user).then((value) =>
          Get.offNamedUntil(
              accountCreatedSuccessfullyScreen, (route) => false));
    }
  }
}
