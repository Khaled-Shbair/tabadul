import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Departments_Products/department_screen.dart';
import '../Widget/custom_circle_button.dart';
import 'Department_Add_Product_Screen.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import 'package:get/get.dart';

class AddAndBuyScreen extends StatelessWidget {
  const AddAndBuyScreen({
    required this.nameDepartment,
    required this.image,
    Key? key,
  }) : super(key: key);
  final String nameDepartment;
  final String image;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 55.w,
          leading: CustomCircleButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => Get.back(),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 42.h,
              margin: EdgeInsetsDirectional.only(
                start: 37.w,
                end: 37.w,
                top: 30.h,
              ),
              decoration: BoxDecoration(
                color: s4,
                borderRadius: BorderRadius.circular(22).w,
              ),
              child: TabBar(
                padding: EdgeInsetsDirectional.only(
                  top: 4.h,
                  bottom: 4.h,
                  end: 5.w,
                  start: 5.w,
                ),
                labelColor: colorWhite,
                unselectedLabelColor: primaryColor,
                labelStyle: TextStyle(
                  fontFamily: kHelveticaL,
                  fontSize: 15.sp,
                ),
                indicator: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(22).w,
                ),
                tabs: [
                  Text('add'.tr),
                  Text('buy'.tr),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DepartmentScreen(
                    image: image,
                    nameDepartment: nameDepartment,
                  ),
                  DepartmentAddProductScreen(nameDepartment),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
