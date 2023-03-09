import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/fonts.dart';
import '../constants/colors.dart';
import '../Widget/custom_circle_button.dart';
import '../Widget/custom_button.dart';
import '../constants/routes.dart';

class ReadyToReceiveScreen extends StatelessWidget {
  const ReadyToReceiveScreen({Key? key}) : super(key: key);

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
        padding: const EdgeInsetsDirectional.only(start: 70, end: 70, top: 80),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            'images/ready_to_receive.svg',
            fit: BoxFit.fitWidth,
            height: 300,
          ),
          const SizedBox(height: 70),
          Text(
            'هل أنت مستعد للاستلام خلال\nساعات ؟',
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
                const EdgeInsetsDirectional.only(top: 20, start: 0, end: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  name: 'نعم',
                  x: 45,
                  y: 85,
                  function: () {
                    Navigator.pushReplacementNamed(context, answerIsYesScreen);
                  },
                ),
                const SizedBox(width: 10),
                CustomButton(
                  name: 'لا',
                  x: 45,
                  y: 85,
                  colorFont: primaryColor,
                  color: s4,
                  function: () {
                    Navigator.pushReplacementNamed(context, answerIsNoScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
