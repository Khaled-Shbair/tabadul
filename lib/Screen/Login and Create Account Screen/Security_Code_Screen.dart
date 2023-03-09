import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../getX/security_code_getx_controller.dart';
import '../../Widget/custom_circle_button.dart';
import '../../Widget/custom_filed_code.dart';
import '../../Widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import 'package:get/get.dart';

class SecurityCodeScreen extends StatelessWidget {
  const SecurityCodeScreen({Key? key, required this.navigator})
      : super(key: key);

  final String navigator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 55.w,
        leading: CustomCircleButton(
          icon: Icons.arrow_back_ios_new,
          onPressed: () => Get.back(),
        ),
        title: Text(
          'security_code'.tr,
          style: TextStyle(
            fontSize: 17.sp,
            fontFamily: kHelveticaL,
            color: primaryColor,
          ),
        ),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsetsDirectional.only(
          top: 50.h,
          start: 37.w,
          end: 37.w,
        ),
        children: [
          SvgPicture.asset(
            'images/login_and_create_account/security_code.svg',
            height: 209.h,
            width: 184.w,
          ),
          SizedBox(height: 25.h),
          Text(
            'security_code_subtitle'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              height: 1.2.h,
              color: s1,
              fontFamily: kHelveticaL,
            ),
          ),
          SizedBox(height: 20.h),
          GetBuilder<SecurityCodeGetxController>(
            init: SecurityCodeGetxController.to,
            builder: (controller) {
              return SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFiledCode(
                      error: controller.error,
                      textEditingController: controller.firstCode,
                      focusNode: controller.firstFocusNode,
                      onChanged: (String value) {
                        if (value.isNotEmpty) {
                          controller.secondFocusNode.requestFocus();
                        }
                      },
                    ),
                    SizedBox(width: 8.w),
                    CustomFiledCode(
                      error: controller.error,
                      textEditingController: controller.secondCode,
                      focusNode: controller.secondFocusNode,
                      onChanged: (String value) {
                        if (value.isNotEmpty) {
                          controller.thirdFocusNode.requestFocus();
                        } else {
                          controller.firstFocusNode.requestFocus();
                        }
                      },
                    ),
                    SizedBox(width: 8.w),
                    CustomFiledCode(
                      error: controller.error,
                      textEditingController: controller.thirdCode,
                      focusNode: controller.thirdFocusNode,
                      onChanged: (String value) {
                        if (value.isNotEmpty) {
                          controller.fourthFocusNode.requestFocus();
                        } else {
                          controller.secondFocusNode.requestFocus();
                        }
                      },
                    ),
                    SizedBox(width: 8.w),
                    CustomFiledCode(
                      error: controller.error,
                      textEditingController: controller.fourthCode,
                      focusNode: controller.fourthFocusNode,
                      onChanged: (String value) {
                        if (value.isNotEmpty) {
                          controller.fifthFocusNode.requestFocus();
                        } else {
                          controller.thirdFocusNode.requestFocus();
                        }
                      },
                    ),
                    SizedBox(width: 8.w),
                    CustomFiledCode(
                      error: controller.error,
                      textEditingController: controller.fifthCode,
                      focusNode: controller.fifthFocusNode,
                      onChanged: (String value) {
                        if (value.isNotEmpty) {
                          controller.sixthFocusNode.requestFocus();
                        } else {
                          controller.fourthFocusNode.requestFocus();
                        }
                      },
                    ),
                    SizedBox(width: 8.w),
                    CustomFiledCode(
                      error: controller.error,
                      textEditingController: controller.sixthCode,
                      focusNode: controller.sixthFocusNode,
                      onChanged: (String value) {
                        if (value.isEmpty) {
                          controller.fifthFocusNode.requestFocus();
                        } else {
                          SecurityCodeGetxController.to.resetCode(navigator);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          CustomButton(
            top: 49.h,
            name: 'resend_code'.tr,
            function: () => SecurityCodeGetxController.to.resetCode(navigator),
          ),
        ],
      ),
    );
  }
}
