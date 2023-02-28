////////////////////////////////////////////////////////////////////////////////
/*
            Screen Successfully registered as a service provider
               صفحة لقد تم تسجيلك في قسم مزودي الخدمات بنجاح
*/
////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widget/custom_circle_button.dart';
import '../../Widget/custom_button.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/routes.dart';

class SuccessfullyRegisteredAsServiceProviderScreen extends StatelessWidget {
  const SuccessfullyRegisteredAsServiceProviderScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 60,
        leading: CustomCircleButton(
          start: 25,
          paddingStart: 5,
          icon: Icons.arrow_back_ios,
          size: 15,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(start: 70, end: 70, top: 100),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            'images/تسجيل مزود الخدمة.svg',
            fit: BoxFit.fitWidth,
            height: 300,
          ),
          const SizedBox(height: 45),
          Text(
            'لقد تم تسجيلك في قسم\n مزودي الخدمات بنجاح',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.8,
              fontSize: 17,
              fontFamily: kHelveticaL,
              color:s1,
            ),
          ),
          Padding(
            padding:
            const EdgeInsetsDirectional.only(top: 40, start: 75, end: 75),
            child: CustomButton(
              name: 'إلغاء',
              x: 45,
              y: 106,
              function: () =>
                  Navigator.pushReplacementNamed(
                      context, listProvideServiceScreen),
            ),
          ),
        ],
      ),
    );
  }
}
