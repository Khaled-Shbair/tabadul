import '../../Widget/custom_widget_details_service_provide.dart';
import '../../getX/detail_service_provide_getx_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widget/custom_button.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import 'package:get/get.dart';

class DetailServiceProvideScreen extends StatelessWidget {
  const DetailServiceProvideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Image.asset(
              'images/Rectangle 31.png',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: 433.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(31).w,
              color: colorWhite,
            ),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding:
                  EdgeInsetsDirectional.only(start: 58.w, end: 37.w, top: 13.h),
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(
                    bottom: 12.h,
                    end: 77.w,
                    start: 77.w,
                  ),
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: s1,
                    borderRadius: BorderRadius.circular(20).w,
                  ),
                ),
                Text(
                  'سامر الحوت',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: kHelveticaL,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 25),
                const CustomWidgetDetailsServiceProvide('عامل'),
                SizedBox(height: 10.h),
                const CustomWidgetDetailsServiceProvide(
                    'مدينة غزة / دير البلح '),
                SizedBox(height: 10.h),
                const CustomWidgetDetailsServiceProvide('عامل كهرباء '),
                SizedBox(height: 10.h),
                const CustomWidgetDetailsServiceProvide('0590005695'),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 70.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 9.w,
                        backgroundColor: primaryColor,
                        child: CircleAvatar(
                          radius: 4.w,
                          backgroundColor: s4,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            'مرحبا اسمي سامر ، أنا بشتغل جميع ما يتعلق بالكهرباء ، ما عليك الا تتواصل معي وما بنقصر  معك',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 11.sp,
                              height: 1.2.h,
                              fontFamily: kHelveticaL,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  name: 'call'.tr,
                  start: 70,
                  end: 70,
                  function: () => DetailServiceProvideGetxController.to
                      .callServiceProvide('0599724037'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
