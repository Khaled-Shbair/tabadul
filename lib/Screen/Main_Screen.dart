import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widget/custom_department_button.dart';
import '../Widget/custom_circle_button.dart';
import 'package:flutter/material.dart';
import '../constants/images.dart';
import 'package:get/get.dart';

import 'Add_And_Buy_Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('main'.tr),
        leadingWidth: 55.w,
        leading: CustomCircleButton(
          icon: Icons.menu,
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
        ),
      ),
      body: GridView(
        padding: EdgeInsetsDirectional.only(
          start: 35.w,
          end: 35.w,
          top: 20.h,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 135.w / 126.h,
        ),
        children: [
          CustomDepartmentButton(
            pathImage: kFurniture,
            nameDepartment: 'furniture_department'.tr,
            onPressed: () => Get.to(
              () => AddAndBuyScreen(
                nameDepartment: 'furniture_department'.tr,
                image:
                    'https://firebasestorage.googleapis.com/v0/b/tabadul-34a2c.appspot.com/o/transparency-computer-desktop-pc-37558.png?alt=media&token=813f6579-359f-4257-9924-5be01dc2e132',
              ),
            ),
          ),
          CustomDepartmentButton(
            pathImage: kCarpet,
            nameDepartment: 'carpets_and_mattresses_department'.tr,
            onPressed: () {},
          ),
          CustomDepartmentButton(
            pathImage: kPhone,
            nameDepartment: 'phone_department'.tr,
            onPressed: () {},
          ),
          CustomDepartmentButton(
            pathImage: kComputer,
            nameDepartment: 'computer_department'.tr,
            onPressed: () {},
          ),
          CustomDepartmentButton(
            pathImage: kMotorcycle,
            nameDepartment: 'motorcycle_department'.tr,
            onPressed: () {},
          ),
          CustomDepartmentButton(
            pathImage: kBicycle,
            nameDepartment: 'bicycle_department'.tr,
            onPressed: () {},
          ),
          CustomDepartmentButton(
            pathImage: kCar,
            nameDepartment: 'car_department'.tr,
            onPressed: () {},
          ),
          CustomDepartmentButton(
            pathImage: kElectricMachines,
            nameDepartment: 'electric_machines_department'.tr,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
