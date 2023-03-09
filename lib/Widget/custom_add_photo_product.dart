import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CustomAddPhotoProduct extends StatelessWidget {
  const CustomAddPhotoProduct({
    required this.onPressed,
    required this.click,
    Key? key,
  }) : super(key: key);
  final void Function() onPressed;
  final bool click;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: click ? s4 : primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10).w,
        ),
      ),
      child: Icon(
        Icons.camera_alt,
        color: click ? primaryColor : s4,
      ),
    );
  }
}
