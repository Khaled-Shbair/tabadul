import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    //
    this.size,
    this.start,
    this.end,
    this.top,
    this.bottom,
    this.paddingEnd,
    this.paddingStart,
  }) : super(key: key);
  final double? start;
  final double? end;
  final double? top;
  final double? bottom;
  final double? size;
  final double? paddingEnd;
  final double? paddingStart;

  //
  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20.w),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsetsDirectional.zero,
          elevation: 5,
          backgroundColor: s4,
        ),
        child: Icon(
          icon,
          color: primaryColor,
          size: 13.r,
        ),
      ),
    );
  }
}
