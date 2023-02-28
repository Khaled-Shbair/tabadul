import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    Key? key,
    required this.onPressed,
    this.icon,
    this.size = 18,
    this.start = 0,
    this.end = 0,
    this.top = 0,
    this.bottom = 0,
    this.paddingEnd = 0,
    this.paddingStart = 0,
  }) : super(key: key);
  final double start;
  final double end;
  final double top;
  final double bottom;
  final double size;
  final double paddingEnd;
  final double paddingStart;
  final Function() onPressed;
  final IconData? icon;

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
          Icons.arrow_back_ios_new,
          color: primaryColor,
          size: 13.r,
        ),
      ),
    );
    // return Container(
    //   margin: EdgeInsetsDirectional.only(
    //     end: end,
    //     start: start,
    //     top: top,
    //     bottom: bottom,
    //   ),
    //   padding: EdgeInsetsDirectional.only(end: paddingEnd, start: paddingStart),
    //   width: 35,
    //   height: 35,
    //   decoration: BoxDecoration(
    //     shape: BoxShape.circle,
    //     color: s4,
    //     boxShadow: [
    //       BoxShadow(
    //         color: s1.withAlpha(51),
    //         offset: const Offset(0, 3),
    //         blurRadius: 6,
    //       ),
    //     ],
    //   ),
    //   child: IconButton(
    //     onPressed: function,
    //     icon: Icon(
    //       icon,
    //       size: size,
    //       color: primaryColor,
    //     ),
    //   ),
    // );
  }
}
