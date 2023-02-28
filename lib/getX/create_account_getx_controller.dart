import '../firebase/firebase_firestore_controller.dart';
import '../firebase/firebase_auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../models/Code Country.dart';
import '../constants/routes.dart';
import 'package:get/get.dart';
import 'dart:async';

class CreateAccountGetxController extends GetxController {
  static CreateAccountGetxController get to => Get.find();
  final FbAuthController _auth = FbAuthController();
  final FbFirestoreController _firestore = FbFirestoreController();

  final List<CodeCountry> _codeCountry = [
    CodeCountry(name: '970+', id: 0, num: 0),
    CodeCountry(name: '972+', id: 1, num: 2),
  ];

  String _selectedCodeCountry = '1';
  late TextEditingController _phoneController;
  late TapGestureRecognizer _tapGestureRecognizer;

  String get selectedCodeCountry => _selectedCodeCountry;

  List get codeCountry => _codeCountry;

  TextEditingController get phoneController => _phoneController;

  TapGestureRecognizer get tapGestureRecognizer => _tapGestureRecognizer;
  bool? _existsPhone;
  String _messageError = '';

  bool? get existsPhone => _existsPhone;

  String get messageError => _messageError;

  late Timer timer;

  @override
  void onInit() {
    _phoneController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () => Get.toNamed(loginScreen);
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

  Future<void> register() async {
    if (_phoneController.text.isNotEmpty &&
        _phoneController.text.length == 10) {
      _firestore.getUserData(
        _phoneController.text,
        then: (value) async {
          if (!value.exists) {
            await _auth.verifyPhoneNumber(_phoneController.text,
                then: (value) => Get.toNamed(securityCodeScreen,
                    arguments: accountCreatedSuccessfullyScreen));
          } else {
            _existsPhone = true;
            _messageError = 'the_number_is_already_registered'.tr;
            timer = Timer.periodic(
              const Duration(seconds: 3),
              (timer) {
                _existsPhone = false;
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
      _existsPhone = true;
      _messageError = 'please_enter_the_number_correctly'.tr;
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        _existsPhone = false;
        update();
      });
      update();
    }
  }
}
