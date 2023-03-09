import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../constants/images.dart';
import '../../constants/routes.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import 'package:get/get.dart';

class OnBoardingOneScreen extends StatelessWidget {
  const OnBoardingOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          kLogoTitle,
          height: 29.h,
          width: 69.w,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 37.w,
          end: 37.w,
          //    top: 34.h,
          bottom: 50.h,
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 120.h),
              child: SvgPicture.asset(
                kArrows,
                //fit: BoxFit.fitWidth,
                height: 157.h,
              ),
            ),
            phoneOne(),
            phoneTwo(),
            man(),
            woman(),
            Column(
              children: [
                textOne(),
                textTwo(),
                SizedBox(height: 36.h),
                slider(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 30),
                  child: buttonWidget(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget phoneOne() {
  return SlideInDown(
    delay: const Duration(seconds: 2),
    from: 20,
    child: Padding(
      padding: EdgeInsetsDirectional.only(bottom: 163.6.h, start: 169.3.w),
      child: Center(
        child: SvgPicture.asset(
          kPhoneOne,
          fit: BoxFit.fitWidth,
          height: 190.35.h,
        ),
      ),
    ),
  );
}

Widget phoneTwo() {
  return SlideInUp(
    from: 20,
    delay: const Duration(seconds: 2),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 320, end: 167),
      child: Center(
        child: SvgPicture.asset(
          kPhoneOne,
          fit: BoxFit.fitWidth,
          height: 190.35.h,
        ),
      ),
    ),
  );
}

Widget man() {
  return SlideInLeft(
    from: 250,
    delay: const Duration(seconds: 2),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 295, start: 110),
      child: Center(
        child: SvgPicture.asset(
          kMan,
          width: 100,
          height: 190,
        ),
      ),
    ),
  );
}

Widget woman() {
  return SlideInRight(
    from: 250,
    delay: const Duration(seconds: 2),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 295, end: 160),
      child: Center(
        child: SvgPicture.asset(
          'kWoman',
          width: 100,
          height: 190,
        ),
      ),
    ),
  );
}

Widget textOne() {
  return FadeInLeft(
    from: 20,
    delay: const Duration(seconds: 3),
    child: Text(
      'fair_return_policy'.tr,
      style: TextStyle(
        color: primaryColor,
        fontSize: 20.sp,
        fontFamily: kHelveticaL,
      ),
    ),
  );
}

Widget textTwo() {
  return FadeInDown(
    delay: const Duration(seconds: 4),
    from: 20,
    child: FadeInUp(
      delay: const Duration(seconds: 4),
      child: Text(
        'on_boarding1'.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: s1,
          fontSize: 15.sp,
          height: 1.5,
          fontFamily: kHelveticaLNeeL,
        ),
      ),
    ),
  );
}

Widget slider() {
  return FadeInDown(
    delay: const Duration(seconds: 3),
    from: 20,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 6.w, backgroundColor: s2),
        SizedBox(width: 11.w),
        CircleAvatar(radius: 6.w, backgroundColor: primaryColor),
      ],
    ),
  );
}

Widget buttonWidget() {
  return FadeInLeft(
    delay: const Duration(seconds: 4),
    from: 5,
    child: Align(
      alignment: AlignmentDirectional.bottomStart,
      child: FloatingActionButton(
        backgroundColor: primaryColor,
        elevation: 0,
        onPressed: () => Get.toNamed(onBoardingTwoScreen),
        child: Icon(Icons.arrow_right_alt, size: 30.w),
      ),
    ),
  );
}
