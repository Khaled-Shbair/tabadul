////////////////////////////////////////////////////////////////////////////////
/*
            Screen Successfully registered as a service provider
               صفحة لقد تم تسجيلك في قسم مزودي الخدمات بنجاح
*/
////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widget/Button_AppBar.dart';
import '../../Widget/Buttons.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/strings.dart';

class SuccessfullyRegisteredAsServiceProviderScreen extends StatelessWidget {
  const SuccessfullyRegisteredAsServiceProviderScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 60,
        leading: ButtonAppBar(
          start: 25,
          paddingStart: 5,
          icon: Icons.arrow_back_ios,
          size: 15,
          function: () => Navigator.pop(context),
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
              fontFamily: FontsApp.helveticaL,
              color: ColorsApp.s1,
            ),
          ),
          Padding(
            padding:
            const EdgeInsetsDirectional.only(top: 40, start: 75, end: 75),
            child: Buttons(
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
