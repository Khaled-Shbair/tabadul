import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.keyboardType,
    required this.nameFiled,
    this.errorText,
    this.maxLength,
    this.suffixIcon = Icons.create,
    this.sizeSuffixIcon = 0,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String nameFiled;
  final String? errorText;
  final IconData suffixIcon;
  final double sizeSuffixIcon;
  final TextEditingController textEditingController;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,

      cursorColor: primaryColor,
      keyboardType: keyboardType,
      controller: textEditingController,
      style: TextStyle(
        fontSize: 11.sp,
        fontFamily: kHelveticaL,
        color: primaryColor.withAlpha(204),
      ),
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsetsDirectional.only(
          top: 8.h,
          bottom: 8.h,
          start: 21.w,
        ),
        suffixIcon: Icon(
          suffixIcon,
          size: sizeSuffixIcon,
          color: primaryColor,
        ),
        hintText: nameFiled,
        hintStyle: TextStyle(
          fontSize: 11.sp,
          fontFamily: kHelveticaL,
          color: primaryColor.withAlpha(204),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4).w,
        ),
        fillColor: s4,
        filled: true,
        errorText: errorText,
      ),
    );
  }
}
