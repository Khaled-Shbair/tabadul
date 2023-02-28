import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../getX/add_information_getx_controller.dart';
import '../../Widget/custom_circle_button.dart';
import '../../Widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../Widget/Menu_Choose.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../Widget/custom_button.dart';
import 'package:get/get.dart';


class AddInformationScreen extends StatelessWidget {
  const AddInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 55.w,
        leading: CustomCircleButton(onPressed: () => Get.back()),
        title: Text(
          'add_information'.tr,
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
          top: 20.h,
          start: 37.w,
          end: 37.w,
        ),
        children: [
          SvgPicture.asset(
            'images/login_and_create_account/add_information.svg',
            height: 211.h,
            width: 212.w,
          ),
          SizedBox(height: 30.h),
          GetBuilder<AddInformationGetxController>(
            init: AddInformationGetxController.to,
            builder: (controller) {
              return CustomTextField(
                keyboardType: TextInputType.text,
                textEditingController: controller.firstName,
                nameFiled: 'first_name'.tr,
              );
            },
          ),
          SizedBox(height: 10.h),
          GetBuilder<AddInformationGetxController>(
            init: AddInformationGetxController.to,
            builder: (controller) {
              return CustomTextField(
                keyboardType: TextInputType.text,
                textEditingController: controller.lastName,
                nameFiled: 'last_name'.tr,
              );
            },
          ),
          SizedBox(height: 10.h),
          GetBuilder<AddInformationGetxController>(
            init: AddInformationGetxController.to,
            builder: (controller) {
              return MenuChoose(
                function: (String? value) {
                  if (value != null) {
                    controller.selectedCity(value);
                  }
                },
                selectedId: controller.selectedCityId,
                list: controller.city,
                nameFiled: 'city'.tr,
              );
            },
          ),
          SizedBox(height: 10.h),
          GetBuilder<AddInformationGetxController>(
            init: AddInformationGetxController.to,
            builder: (controller) {
              return MenuChoose(
                function: (String? value) {
                  if (value != null) {
                    controller.selectedArea(value);
                  }
                },
                selectedId: controller.selectedAreaId,
                list: controller.area,
                nameFiled: 'area_street'.tr,
              );
            },
          ),
          SizedBox(height: 20.h),
          CustomButton(
            name: 'next'.tr,
            function: () =>
                AddInformationGetxController.to.createUser(phone: '0599724037'),
          ),
        ],
      ),
    );
  }
}
