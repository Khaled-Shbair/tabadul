import '../firebase/firebase_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SecurityCodeGetxController extends GetxController {
  static SecurityCodeGetxController get to => Get.find();
  final FbAuthController _auth = FbAuthController();
  late TextEditingController _firstCode;
  late TextEditingController _secondCode;
  late TextEditingController _thirdCode;
  late TextEditingController _fourthCode;
  late TextEditingController _fifthCode;
  late TextEditingController _sixthCode;
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;
  late FocusNode _fifthFocusNode;
  late FocusNode _sixthFocusNode;

  TextEditingController get firstCode => _firstCode;

  TextEditingController get secondCode => _secondCode;

  TextEditingController get thirdCode => _thirdCode;

  TextEditingController get fourthCode => _fourthCode;

  TextEditingController get fifthCode => _fifthCode;

  TextEditingController get sixthCode => _sixthCode;

  FocusNode get firstFocusNode => _firstFocusNode;

  FocusNode get secondFocusNode => _secondFocusNode;

  FocusNode get thirdFocusNode => _thirdFocusNode;

  FocusNode get fourthFocusNode => _fourthFocusNode;

  FocusNode get fifthFocusNode => _fifthFocusNode;

  FocusNode get sixthFocusNode => _sixthFocusNode;
  bool _error = false;

  bool get error => _error;
  late Timer timer;

  @override
  void onInit() {
    _firstCode = TextEditingController();
    _secondCode = TextEditingController();
    _thirdCode = TextEditingController();
    _fourthCode = TextEditingController();
    _fifthCode = TextEditingController();
    _sixthCode = TextEditingController();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
    _fifthFocusNode = FocusNode();
    _sixthFocusNode = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    _firstCode.dispose();
    _secondCode.dispose();
    _thirdCode.dispose();
    _fourthCode.dispose();
    _fifthCode.dispose();
    _sixthCode.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    _fifthFocusNode.dispose();
    _sixthFocusNode.dispose();
    super.onClose();
  }

  String _code = '';

  Future<void> resetCode(String nextScreen) async {
    if (_firstCode.text.isNotEmpty &&
        _secondCode.text.isNotEmpty &&
        _thirdCode.text.isNotEmpty &&
        _fourthCode.text.isNotEmpty &&
        _fifthCode.text.isNotEmpty &&
        _sixthCode.text.isNotEmpty) {
      _code = _firstCode.text +
          _secondCode.text +
          _thirdCode.text +
          _fourthCode.text +
          _fifthCode.text +
          _sixthCode.text;
      try {
        bool result = await _auth.submitOTP(_code);
        if (result == true) {
          Get.offAllNamed(nextScreen);
        } else {
          _error = true;
          timer = Timer.periodic(
            const Duration(seconds: 3),
            (timer) {
              _error = false;
              update();
            },
          );
          update();
        }
      } catch (e) {
        Get.snackbar('Code uncorrected', '');
      }
    } else {
      _error = true;
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (timer) {
          _error = false;
          update();
        },
      );
      update();
    }
  }
}
