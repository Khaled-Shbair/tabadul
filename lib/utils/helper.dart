import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import 'package:get/get.dart';

mixin Helper {

  void showSnackBar() {
    Fluttertoast.showToast(
      msg: 'please_enter_code_correctly'.tr,
      fontSize: 12,
      timeInSecForIosWeb: 5,
      textColor: kErrorColor,
      gravity: ToastGravity.CENTER_RIGHT,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.transparent,
    );
  }
}
/*
  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'يرجى إدخال الرقم بشكل صحيح',
          style: TextStyle(
            fontSize: 12,
            fontFamily: kHelveticaL,
            color: s3,
          ),
        ),
        padding: const EdgeInsetsDirectional.only(bottom: 300, start: 50),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

 */
