import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.function,
    required this.name,
    this.x = 39,
    this.y = double.infinity,
    this.fontSize = 15,
    this.color = primaryColor,
    this.colorFont = Colors.white,
    this.start = 20,
    this.end = 20,
    this.top = 0,
    this.bottom = 0,
  }) : super(key: key);
  final Function() function;
  final String name;
  final double x;
  final double y;
  final double fontSize;
  final Color color;
  final Color colorFont;
  final double start;
  final double end;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: start.w,
        end: end.w,
        top: top.h,
        bottom: bottom.h,
      ),
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          minimumSize: Size(y.w, x.h),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: colorFont,
            fontSize: fontSize.sp,
            fontFamily: kHelveticaL,
          ),
        ),
      ),
    );
  }
}
