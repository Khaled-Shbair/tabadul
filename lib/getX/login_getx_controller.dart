import '../firebase/firebase_firestore_controller.dart';
import '../firebase/firebase_auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../models/Code Country.dart';
import '../constants/routes.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'profile_getx_controller.dart';

class LoginGetxController extends GetxController {
  static LoginGetxController get to => Get.find();
  final FbAuthController _auth = FbAuthController();
  final FbFirestoreController _firestore = FbFirestoreController();
  final List<CodeCountry> _codeCountry = <CodeCountry>[
    CodeCountry(name: '970+', id: 0, num: 0),
    CodeCountry(name: '972+', id: 1, num: 2),
  ];

  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _phoneController;
  late Timer timer;
  bool? _existsPhone;
  String? _value;
  String _selectedCodeCountry = '0';

  TapGestureRecognizer get tapGestureRecognizer => _tapGestureRecognizer;

  String get selectedCodeCountry => _selectedCodeCountry;

  String? get value => _value;

  List<CodeCountry> get codeCountry => _codeCountry;

  TextEditingController get phoneController => _phoneController;

  bool? get existsPhone => _existsPhone;

  @override
  void onInit() {
    _phoneController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () => Get.toNamed(createAccountScreen);
    super.onInit();
  }

  @override
  void onClose() {
    _phoneController.dispose();
    _tapGestureRecognizer.dispose();
    super.onClose();
  }

  void selectedCode(String value) {
    _selectedCodeCountry = value;
    update();
  }

  Future<void> login() async {
    if (_phoneController.text.isNotEmpty &&
        _phoneController.text.length == 10) {
      _firestore.getUserData(
        _phoneController.text,
        then: (value) async {
          if (value.exists) {
            await _auth.verifyPhoneNumber(_phoneController.text,
                then: (value) =>
                    Get.toNamed(securityCodeScreen, arguments: menuScreen));
            ProfileGetxController.to.getUserData(_phoneController.text);
          } else {
            _existsPhone = false;
            timer = Timer.periodic(
              const Duration(seconds: 3),
              (timer) {
                _existsPhone = true;
                update();
              },
            );
            update();
          }
        },
        catchError: (e) {
          Get.snackbar('', 'Oops there is something wrong');
        },
      );
    } else {
      _existsPhone = false;
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        _existsPhone = true;
        update();
      });
      update();
    }
  }
}
