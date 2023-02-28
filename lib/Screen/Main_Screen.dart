import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../constants/fonts.dart';
import '../Widget/custom_circle_button.dart';
import '../Widget/Section_Button.dart';
import '../constants/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

Widget openDrawer() => openDrawer();

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الرئيسية',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: kHelveticaL,
            color: primaryColor,
          ),
        ),
        leadingWidth: 75,
        leading: CustomCircleButton(
          start: 35,
          icon: Icons.menu,
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
      ),
      body: GridView(
        padding: const EdgeInsetsDirectional.only(start: 37, end: 37, top: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 135 / 126,
        ),
        children: [
          SectionButton(
            pathImage: 'images/Departments/Furniture.svg',
            nameSection: 'قسم الأثاث',
            function: () {},
          ),
          SectionButton(
            pathImage: 'images/Departments/carpet.svg',
            nameSection: 'قسم السجاد والمفارش',
            function: () {},
          ),
          SectionButton(
            pathImage: 'images/Departments/phone.svg',
            nameSection: 'قسم أجهزة الجوال',
            function: () {},
          ),
          SectionButton(
            pathImage: 'images/Departments/computer.svg',
            nameSection: 'قسم أجهزة الحاسوب',
            function: () {},
          ),
          SectionButton(
            pathImage: 'images/Departments/Motorcycle.svg',
            nameSection: 'قسم الدراجات النارية',
            function: () {},
          ),
          SectionButton(
            pathImage: 'images/Departments/bicycle.svg',
            nameSection: 'قسم الدراجات الهوائية',
            function: () {},
          ),
          SectionButton(
            pathImage: 'images/Departments/car.svg',
            nameSection: 'قسم السيارات',
            function: () {},
          ),
          SectionButton(
            pathImage: 'images/Departments/electric_machines.svg',
            nameSection: 'قسم الأجهزة الكهربائية',
            function: () {},
          ),
        ],
      ),
    );
  }
}
