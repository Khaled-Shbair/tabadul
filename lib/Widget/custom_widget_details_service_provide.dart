import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';

class CustomWidgetDetailsServiceProvide extends StatelessWidget {
  const CustomWidgetDetailsServiceProvide(
    this.text, {
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.size,
    Key? key,
  }) : super(key: key);
  final String text;
  final double? size;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        CircleAvatar(
          radius: 9.w,
          backgroundColor: primaryColor,
          child: CircleAvatar(
            radius: 4.w,
            backgroundColor: s4,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 11.sp,
            fontFamily: kHelveticaL,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
