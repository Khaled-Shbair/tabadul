import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../getX/login_getx_controller.dart';
import '../../Widget/custom_text_field.dart';
import '../../Widget/Menu_Choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../Widget/custom_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'login'.tr,
          style: TextStyle(
            fontSize: 17.sp,
            fontFamily: kHelveticaL,
            color: primaryColor,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          top: 58.7.h,
          start: 37.w,
          end: 37.w,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            'images/login_and_create_account/login.svg',
            height: 167.h,
            width: 89.w,
          ),
          SizedBox(height: 66.7.h),
          GetBuilder<LoginGetxController>(
            init: LoginGetxController.to,
            builder: (controller) {
              return Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomTextField(
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      textEditingController: controller.phoneController,
                      nameFiled: 'enter_mobile_number'.tr,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  MenuChoose(
                    function: (value) {
                      if (value != null) {
                        controller.selectedCode(value);
                      }
                    },
                    fontSize: 14.sp,
                    selectedId: controller.selectedCodeCountry,
                    list: controller.codeCountry,
                    nameFiled: controller
                        .codeCountry[int.parse(controller.selectedCodeCountry)]
                        .name,
                  ),
                ],
              );
            },
          ),
          Container(
            height: 27.h,
            margin: EdgeInsetsDirectional.only(
              top: 6.h,
              start: 20.w,
            ),
            child: GetBuilder<LoginGetxController>(
              init: LoginGetxController.to,
              builder: (controller) {
                if (controller.existsPhone == false) {
                  return Text(
                    'please_enter_the_number_correctly'.tr,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: kHelveticaL,
                      color: kErrorColor,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          CustomButton(
            top: 16.h,
            bottom: 43.h,
            name: 'login_button'.tr,
            function: () => LoginGetxController.to.login(),
          ),
          Center(
            child: GetBuilder<LoginGetxController>(
              init: LoginGetxController.to,
              builder: (controller) {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'do_not_have_an_account'.tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: kHelveticaL,
                          color: s1,
                        ),
                      ),
                      TextSpan(
                        recognizer: controller.tapGestureRecognizer,
                        text: 'create_account'.tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          decoration: TextDecoration.underline,
                          fontFamily: kHelveticaL,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
