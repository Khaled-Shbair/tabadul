import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../Widget/Button_AppBar.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 78,
        leading: ButtonAppBar(
          start: 40,
          icon: Icons.menu,
          function: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        actions: [
          ButtonAppBar(
            end: 40,
            icon: Icons.create,
            function: () {},
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
              color: ColorsApp.s7,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  'سجى الأشرم',
                  style: TextStyle(
                    color: ColorsApp.s,
                    fontSize: 17,
                    fontFamily: FontsApp.helveticaL,
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
                            color: ColorsApp.s,
                            fontSize: 15,
                            fontFamily: FontsApp.helveticaL,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'المدينة',
                          style: TextStyle(
                            color: ColorsApp.s,
                            fontSize: 15,
                            fontFamily: FontsApp.helveticaL,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'المنطقة',
                          style: TextStyle(
                            color: ColorsApp.s,
                            fontSize: 15,
                            fontFamily: FontsApp.helveticaL,
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
                            color: ColorsApp.s,
                            fontSize: 15,
                            fontFamily: FontsApp.helveticaL,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'مدينة غزة',
                          style: TextStyle(
                            color: ColorsApp.s,
                            fontSize: 15,
                            fontFamily: FontsApp.helveticaL,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'النصيرات',
                          style: TextStyle(
                            color: ColorsApp.s,
                            fontSize: 15,
                            fontFamily: FontsApp.helveticaL,
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
