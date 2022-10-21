import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/fonts.dart';
import '../Widget/Button_AppBar.dart';
import '../Widget/Buttons.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class AnswerIsYesScreen extends StatelessWidget {
  const AnswerIsYesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 78,
        leading: ButtonAppBar(
          start: 40,
          paddingStart: 5,
          icon: Icons.arrow_back_ios,
          function: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(start: 60, end: 60, top: 100),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            'images/Answer is yes.svg',
            fit: BoxFit.fitWidth,
            height: 300,
          ),
          const SizedBox(height: 45),
          Text(
            'أهلاً وسهلاً بك عزيزي\nسيتم التواصل معك خلال ساعات',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.8,
              fontSize: 18,
              fontFamily: FontsApp.helveticaL,
              color: ColorsApp.s1,
            ),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 50, start: 80, end: 80),
            child: Buttons(
              name: 'حسنا',
              x: 50,
              y: 106,
              function: () =>
                  Navigator.pushNamed(context, listProvideServiceScreen),
            ),
          ),
        ],
      ),
    );
  }
}
