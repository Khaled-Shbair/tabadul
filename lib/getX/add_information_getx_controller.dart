import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/routes.dart';
import '../firebase/firebase_firestore_controller.dart';
import '../models/city_model.dart';
import '../models/user_model.dart';

class AddInformationGetxController extends GetxController {
  static AddInformationGetxController get to => Get.find();
  final FbFirestoreController _firestore = FbFirestoreController();
  final RxList<CityModel> _cities = <CityModel>[].obs;

  List<CityModel> area = <CityModel>[
    CityModel(nameAr: 'غزة', id: 1),
    CityModel(nameAr: 'خانيونس', id: 2),
    CityModel(nameAr: 'رفع', id: 3),
    CityModel(nameAr: 'النصيرات', id: 4),
    CityModel(nameAr: 'دير البلح', id: 5),
    CityModel(nameAr: 'المغازي', id: 6),
    CityModel(nameAr: 'الزهرة', id: 7),
  ];
  String? _selectedCityId;
  String? _selectedAreaId;
  late TextEditingController _firstName;
  late TextEditingController _lastName;

  List<CityModel> get cities => _cities;

  TextEditingController get firstName => _firstName;

  String? get selectedCityId => _selectedCityId;

  String? get selectedAreaId => _selectedAreaId;

  TextEditingController get lastName => _lastName;
  final RxBool loading = false.obs;

  @override
  void onInit() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    getCities();
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
      UserModel user = UserModel(
        image:
            'https://firebasestorage.googleapis.com/v0/b/tabadul-34a2c.appspot.com/o/user.png?alt=media&token=bbae8920-b1ee-47be-b8d7-2af1e7187cee',
        id: phone,
        phone: phone,
        firstName: _firstName.text,
        lastName: _lastName.text,
        city: _cities[int.parse(_selectedCityId!)].nameAr,
        street: area[int.parse(_selectedAreaId!)].nameAr,
      );
      await _firestore.createUser(phone, user).then((value) =>
          Get.offNamedUntil(
              accountCreatedSuccessfullyScreen, (route) => false));
    }
  }

  Future<void> getCities() async {
    loading(true);
    _cities([]);
    await _firestore.getCities(
      then: (value) {
        for (var element in value.docs) {
          print(element.data().toString());
          _cities.add(CityModel.fromMap(element.data()));
          print(_cities.toString());
          loading(false);

        }
      },
      catchError: (e) {
        loading(true);
      },
    );
  }
}
