import 'package:flutter/material.dart';
import 'Screen/Main_Screen.dart';
import 'Screen/Notifications_Screen.dart';
import 'Screen/Provide_Service_Screen/Successfully_Registered_As_Service_Provider_Screen.dart';
import 'Screen/Provide_Service_Screen/Service_Provide_Registration_Screen.dart';
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
    BnItem(widget: const ServiceProviderRegistrationScreen()),
    BnItem(widget: const ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsetsDirectional.only(
          start: 37,
          end: 37,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          color: const Color(0XFF464698),
          borderRadius: BorderRadius.circular(10),
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
                    onTap: () {
                      setState(() {
                        selectedIndex = x;
                      });
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(data[x], color: Colors.white),
                          if (x == selectedIndex)
                            Container(
                              margin: const EdgeInsetsDirectional.only(top: 5),
                              height: 3,
                              width: 5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
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
