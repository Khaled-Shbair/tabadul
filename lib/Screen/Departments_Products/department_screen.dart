import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class DepartmentScreen extends StatelessWidget {
  const DepartmentScreen({
    required this.nameDepartment,
    required this.image,
    Key? key,
  }) : super(key: key);
  final String nameDepartment;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 37.w,
          end: 37.w,
          top: 25.h,
        ),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,

          shrinkWrap: true,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CircleAvatar(radius: 10.w, backgroundColor: s4),
                Text(
                  ' $nameDepartment',
                  style: TextStyle(
                    color: primaryColor,
                    fontFamily: kHelveticaL,
                    fontSize: 17.sp,
                    height: 1.4,
                  ),
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsetsDirectional.only(top: 20.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 136.w / 154.h,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 14.w,
              ),
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: s4,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4).w,
                    ),
                  ),
                  child: Image.network(
                    image.isNotEmpty
                        ? image
                        : 'https://firebasestorage.googleapis.com/v0/b/tabadul-34a2c.appspot.com/o/transparency-computer-desktop-pc-37558.png?alt=media&token=813f6579-359f-4257-9924-5be01dc2e132',
                  ),
                  onPressed: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
