import 'package:flutter/material.dart';

import '../../Widget/custom_circle_button.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/routes.dart';

class ProfileProvideServiceScreen extends StatefulWidget {
  const ProfileProvideServiceScreen({Key? key}) : super(key: key);

  @override
  State<ProfileProvideServiceScreen> createState() =>
      _ProfileProvideServiceScreenState();
}

class _ProfileProvideServiceScreenState
    extends State<ProfileProvideServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الملف الشخصي (مزود الخدمة)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: kHelveticaL,
            color:primaryColor,
          ),
        ),
        leadingWidth: 60,
        leading: CustomCircleButton(
          start: 25,
          icon: Icons.menu,
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          CustomCircleButton(
            end: 30,
            icon: Icons.create,
            onPressed: () =>
                Navigator.pushNamed(context, serviceProviderAlterScreen),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(
          top: 50,
          start: 37,
          end: 37,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/saja.jpg'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 4),
            margin: const EdgeInsetsDirectional.only(top: 20),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: s4,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'سجي الأشرم',
              style: TextStyle(
                fontSize: 12,
                fontFamily: kHelveticaL,
                color: primaryColor.withAlpha(204),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 4),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: s4,
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsetsDirectional.only(top: 20),
            child: Text(
              '0592638012',
              style: TextStyle(
                fontSize: 12,
                fontFamily:kHelveticaL,
                color: primaryColor.withAlpha(204),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 4),
            margin: const EdgeInsetsDirectional.only(top: 20),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: s4,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'مهندسة حاسوب',
              style: TextStyle(
                fontSize: 12,
                fontFamily: kHelveticaL,
                color: primaryColor.withAlpha(204),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 4),
            margin: const EdgeInsetsDirectional.only(top: 20),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color:s4,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'غزة',
              style: TextStyle(
                fontSize: 12,
                fontFamily: kHelveticaL,
                color: primaryColor.withAlpha(204),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 4),
            margin: const EdgeInsetsDirectional.only(top: 20),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: s4,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'النصيرات',
              style: TextStyle(
                fontSize: 12,
                fontFamily: kHelveticaL,
                color: primaryColor.withAlpha(204),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
