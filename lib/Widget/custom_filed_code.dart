import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';

class CustomFiledCode extends StatelessWidget {
  const CustomFiledCode({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.onChanged,
    required this.error,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String value) onChanged;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        autofocus: true,
        controller: textEditingController,
        focusNode: focusNode,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        cursorColor: primaryColor,
        cursorRadius: const Radius.circular(20).w,
        style: TextStyle(
          color: primaryColor,
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.only(
            top: 10.h,
            bottom: 10.h,
            start: 12.w,
            end: 12.w,
          ),
          counterText: '',
          hintText: '_',
          hintStyle: TextStyle(
            color: primaryColor,
            fontSize: 20.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10).w,
            borderSide: BorderSide.none,
          ),
          fillColor: error ? kErrorColor : s4,
          filled: true,
        ),
      ),
    );
  }
}
