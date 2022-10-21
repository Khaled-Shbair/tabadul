import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';

mixin Helper {

  void showSnackBar() {
    Fluttertoast.showToast(
      msg: 'يرجى إدخال الرقم بشكل صحيح',
      fontSize: 12,
      timeInSecForIosWeb: 5,
      textColor: ColorsApp.s3,
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
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s3,
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
