import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../constants/routes.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import 'package:get/get.dart';

class AccountCreatedSuccessfullyScreen extends StatelessWidget {
  const AccountCreatedSuccessfullyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 37.w,
          end: 37.w,
          bottom: 83.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  imageTwoWidget(),
                  imageOneWidget(),
                ],
              ),
            ),
            SizedBox(height: 35.h),
            textWidget(),
            SizedBox(height: 32.h),
            buttonWidget(),
          ],
        ),
      ),
    );
  }
}

Widget imageOneWidget() {
  return Center(
    child: FadeIn(
      delay: const Duration(seconds: 2),
      child: SvgPicture.asset(
        'images/login_and_create_account/image_one.svg',
        width: double.infinity,
      ),
    ),
  );
}

Widget imageTwoWidget() {
  return FadeInDown(
    delay: const Duration(seconds: 3),
    child: Padding(
      padding: EdgeInsetsDirectional.only(
        top: 100.h,
      ),
      child: SvgPicture.asset(
        'images/login_and_create_account/image_two.svg',
        width: 227.w,
      ),
    ),
  );
}

Widget textWidget() {
  return Align(
    alignment: AlignmentDirectional.center,
    child: FadeInUp(
      delay: const Duration(seconds: 4),
      child: Text(
        'the_account_has_been_created_successfully'.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: s1,
          fontSize: 17.sp,
          height: 1.5.h,
          fontFamily: kHelveticaL,
        ),
      ),
    ),
  );
}

Widget buttonWidget() {
  return FadeInLeft(
    delay: const Duration(seconds: 5),
    child: FloatingActionButton(
      backgroundColor: primaryColor,
      elevation: 0,
      onPressed: () => Get.offNamedUntil(menuScreen, (route) => false),
      child: Icon(Icons.arrow_right_alt, size: 30.w),
    ),
  );
}
