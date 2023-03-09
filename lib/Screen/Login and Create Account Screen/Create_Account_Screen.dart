import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../getX/create_account_getx_controller.dart';
import '../../Widget/custom_text_field.dart';
import '../../Widget/custom_menu_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../Widget/custom_button.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'create_account'.tr,
          style: TextStyle(
            fontSize: 17.sp,
            fontFamily: kHelveticaL,
            color: primaryColor,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          top: 44.5.h,
          start: 37.w,
          end: 37.w,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            'images/login_and_create_account/create_account.svg',
            height: 196.h,
            width: 221.w,
          ),
          SizedBox(height: 62.8.h),
          GetBuilder<CreateAccountGetxController>(
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
                  CustomMenuChoose(
                    name: 'nameAr',
                    function: (value) {
                      if (value != null) {
                        controller.selectedCode(value);
                      }
                    },
                    fontSize: 14.sp,
                    selectedId: controller.selectedCodeCountry,
                    list: controller.codeCountry,
                    nameFiled: controller.codeCountry[0].name,
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
            child: GetBuilder<CreateAccountGetxController>(
              init: CreateAccountGetxController.to,
              builder: (controller) {
                if (controller.existsPhone == true) {
                  return Text(
                    controller.messageError,
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
            name: 'create_account'.tr,
            function: () => CreateAccountGetxController.to.register(),
          ),
          Center(
            child: GetBuilder<CreateAccountGetxController>(
              init: CreateAccountGetxController.to,
              builder: (controller) {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'already_have_an_account'.tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: kHelveticaL,
                          color: s1,
                        ),
                      ),
                      TextSpan(
                        recognizer: controller.tapGestureRecognizer,
                        text: 'login_button'.tr,
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
