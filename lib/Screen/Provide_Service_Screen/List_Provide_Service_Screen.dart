import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabadul/constants/routes.dart';
import '../../Widget/custom_circle_button.dart';
import '../../Widget/custom_button.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import 'package:get/get.dart';

class ListProvideServiceScreen extends StatelessWidget {
  const ListProvideServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list_service_provide'.tr),
        leadingWidth: 55.w,
        leading: CustomCircleButton(
          icon: Icons.menu,
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        padding: EdgeInsetsDirectional.only(
          top: 50.h,
          start: 37.w,
          end: 37.w,
        ),
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(end: 10.w, bottom: 12.h),
                height: 70.h,
                width: 72.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: s4,
                  borderRadius: BorderRadius.circular(10).w,
                  image: const DecorationImage(
                    image: AssetImage('images/test.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'علي أحمد',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: kHelveticaL,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    'سباك كهربائي',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: kHelveticaLNeeL,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20,),
              CustomButton(
                x: 30,
                y: 63,
                fontSize: 10,
                name: 'call'.tr,
                function: () => Get.toNamed(detailServiceProvideScreen),
              ),
            ],
          );
        },
      ),
    );
  }
}
/*
    return Row(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(end: 10.w, bottom: 12.h),
                height: 69.h,
                width: 72.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: s4,
                  borderRadius: BorderRadius.circular(10).w,
                  image: const DecorationImage(
                    image: AssetImage('images/test.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'علي أحمد',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: kHelveticaL,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    'سباك كهربائي',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: kHelveticaLNeeL,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              // CustomButton(
              //
              //   fontSize: 10,
              //   name: 'اتصل',
              //   function: () {},
              // ),
            ],
          );
 */
