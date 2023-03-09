import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

class CustomDepartmentButton extends StatelessWidget {
  const CustomDepartmentButton({
    Key? key,
    required this.pathImage,
    required this.nameDepartment,
    required this.onPressed,
  }) : super(key: key);

  final String nameDepartment;
  final String pathImage;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: s4,
        shadowColor: primaryColor,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10).w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            pathImage,
            height: 45.h,
            width: 45.w,
          ),
          Text(
            nameDepartment,
            style: TextStyle(
              color: primaryColor,
              fontSize: 11.sp,
              fontFamily: kHelveticaL,
            ),
          ),
        ],
      ),
    );
  }
}
