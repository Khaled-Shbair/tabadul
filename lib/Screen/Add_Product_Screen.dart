import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../getX/add_product_getx_controller.dart';
import '../Widget/custom_add_photo_product.dart';
import '../Widget/custom_circle_button.dart';
import '../Widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../Widget/custom_button.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen(this.nameDepartment, {Key? key}) : super(key: key);
  final String nameDepartment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_product'.tr),
        leadingWidth: 55.w,
        leading: CustomCircleButton(
          icon: Icons.arrow_back_ios,
          onPressed: () => Get.back(),
        ),
      ),
      body: GetBuilder<AddProductGetxController>(
        init: AddProductGetxController.to,
        builder: (controller) {
          return ListView(
            padding: EdgeInsetsDirectional.only(
              start: 37.w,
              end: 37.w,
              top: 20.h,
            ),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              GridView(
                padding: EdgeInsetsDirectional.only(start: 43.w, end: 43.w),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 90.w / 85.h,
                ),
                children: [
                  CustomAddPhotoProduct(
                    onPressed: () => controller.boxOne,
                    click: controller.clickOne,
                  ),
                  CustomAddPhotoProduct(
                    onPressed: () => controller.boxTwo(),
                    click: controller.clickTwo,
                  ),
                  CustomAddPhotoProduct(
                    onPressed: () => controller.boxThree(),
                    click: controller.clickThree,
                  ),
                  CustomAddPhotoProduct(
                    onPressed: () => controller.boxFour(),
                    click: controller.clickFour,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              CustomTextField(
                keyboardType: TextInputType.text,
                textEditingController: controller.productController,
                nameFiled: 'name_product'.tr,
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                keyboardType: TextInputType.text,
                textEditingController: controller.priceController,
                nameFiled: 'price'.tr,
              ),
              SizedBox(height: 20.h),
              TextField(
                keyboardType: TextInputType.text,
                cursorColor: primaryColor,
                maxLines: 4,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: kHelveticaL,
                  color: primaryColor.withAlpha(204),
                ),
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsetsDirectional.only(
                    start: 20.w,
                    top: 13.h,
                  ),
                  hintText: 'description_of_product'.tr,
                  hintMaxLines: 4,
                  hintStyle: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: kHelveticaL,
                    color: primaryColor.withAlpha(204),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(4).w,
                  ),
                  fillColor: s4,
                  filled: true,
                ),
              ),
              CustomButton(
                name: 'add'.tr,
                fontSize: 12,
                top: 30,
                function: () => controller.addProduct(),
              ),
            ],
          );
        },
      ),
    );
  }
}
