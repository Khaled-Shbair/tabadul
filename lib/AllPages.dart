import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Screen/Provide_Service_Screen/profile_screen.dart';
import 'Screen/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'Screen/Main_Screen.dart';
import 'constants/colors.dart';
import 'models/BnItem.dart';

class AllPages extends StatefulWidget {
  const AllPages({
    Key? key,
  }) : super(key: key);

  @override
  State<AllPages> createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  int selectedIndex = 0;
  List<IconData> data = [
    Icons.house,
    Icons.notifications_active,
    Icons.volunteer_activism_sharp,
    Icons.person,
  ];
  final List<BnItem> bnItem = [
    BnItem(widget: const MainScreen()),
    BnItem(widget: const NotificationsScreen()),
    BnItem(widget: const ProfileScreen()),
    BnItem(widget: const ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50.h,
        margin: EdgeInsetsDirectional.only(
          start: 37.w,
          end: 37.w,
          bottom: 24.h,
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10).w,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int x = 0; x < data.length; x++) ...<Expanded>{
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = x),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(data[x], color: Colors.white),
                          SizedBox(height: 4.h),
                          if (x == selectedIndex)
                            Container(
                              height: 3.h,
                              width: 5.w,
                              decoration: BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.circular(5).w,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              }
            ],
          ),
        ),
      ),
      body: bnItem[selectedIndex].widget,
    );
  }
}
