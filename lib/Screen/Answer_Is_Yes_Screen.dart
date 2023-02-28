import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/fonts.dart';
import '../Widget/custom_circle_button.dart';
import '../Widget/custom_button.dart';
import '../constants/colors.dart';
import '../constants/routes.dart';

class AnswerIsYesScreen extends StatelessWidget {
  const AnswerIsYesScreen({Key? key}) : super(key: key);

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
        padding: const EdgeInsetsDirectional.only(start: 60, end: 60, top: 100),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            'images/answer_is_yes.svg',
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
              fontFamily: kHelveticaL,
              color: s1,
            ),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 50, start: 80, end: 80),
            child: CustomButton(
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
