import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constants/fonts.dart';
import '../constants/routes.dart';
import '../constants/colors.dart';
import '../Widget/custom_circle_button.dart';
import '../Widget/custom_button.dart';

class WaitForPickupScreen extends StatelessWidget {
  const WaitForPickupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 78,
        leading: CustomCircleButton(
          start: 40,
          paddingStart: 5,
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(start: 70, end: 70, top: 100),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset('images/wait.svg', fit: BoxFit.fitWidth),
          const SizedBox(height: 45),
          Text(
            'the_time_has_been_set_successfully'.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              height: 1.8,
              fontSize: 17,
              fontFamily: kHelveticaL,
              color: s1,
            ),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 40, start: 75, end: 75),
            child: CustomButton(
              name: 'إلغاء',
              x: 45,
              y: 106,
              function: () {
                Navigator.pushNamed(context, listProvideServiceScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
