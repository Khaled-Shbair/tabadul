import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widget/custom_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Widget/custom_button.dart';
import '../constants/images.dart';
import '../constants/routes.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import 'package:get/get.dart';

class AddedSuccessfullyScreen extends StatelessWidget {
  const AddedSuccessfullyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 55.w,
        leading: CustomCircleButton(
          icon: Icons.arrow_back_ios_new,
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 77.w, end: 77.w, top: 130.h),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(kAddedSuccessfully, height: 193.h),
          SizedBox(height: 30.h),
          Text(
            'added_successfully'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.2.h,
              fontSize: 17.sp,
              fontFamily: kHelveticaL,
              color: s1,
            ),
          ),
          CustomButton(
            name: 'cancel'.tr,
            start: 40.w,
            end: 40.w,
            top: 30.h,
            fontSize: 12,
            function: () => Get.toNamed(listProvideServiceScreen),
          ),
        ],
      ),
    );
  }
}
