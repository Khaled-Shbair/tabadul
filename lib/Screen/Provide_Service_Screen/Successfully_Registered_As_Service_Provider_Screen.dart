import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../Widget/custom_circle_button.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 78,
        leading: CustomCircleButton(
          start: 40,
          icon: Icons.menu,
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        actions: [
          CustomCircleButton(
            end: 40,
            icon: Icons.create,
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            margin:
                const EdgeInsetsDirectional.only(start: 37, end: 37, top: 190),
            padding: const EdgeInsetsDirectional.only(
              start: 30,
              end: 55,
              top: 50,
              bottom: 48,
            ),
            decoration: BoxDecoration(
              color: s7,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  'سجى الأشرم',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 17,
                    fontFamily: kHelveticaL,
                  ),
                ),
                const SizedBox(height: 39),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'رقم الجوال',
                          style: TextStyle(
                            color:primaryColor,
                            fontSize: 15,
                            fontFamily: kHelveticaL,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'المدينة',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontFamily: kHelveticaL,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'المنطقة',
                          style: TextStyle(
                            color:primaryColor,
                            fontSize: 15,
                            fontFamily: kHelveticaL,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '0592638012',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontFamily: kHelveticaL,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'مدينة غزة',
                          style: TextStyle(
                            color:primaryColor,
                            fontSize: 15,
                            fontFamily: kHelveticaL,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'النصيرات',
                          style: TextStyle(
                            color:primaryColor,
                            fontSize: 15,
                            fontFamily: kHelveticaL,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(top: 80),
            child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('images/saja.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
