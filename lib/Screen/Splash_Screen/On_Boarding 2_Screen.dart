import '../../shared_preference/pref_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../constants/strings.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import 'package:get/get.dart';

class OnBoarding2Screen extends StatefulWidget {
  const OnBoarding2Screen({Key? key}) : super(key: key);

  @override
  State<OnBoarding2Screen> createState() => _OnBoarding2ScreenState();
}

class _OnBoarding2ScreenState extends State<OnBoarding2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 37,
          end: 37,
          top: 50,
          bottom: 50,
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            imageOne(),
            imageTwo(),
            imageThree(),
            textOne(),
            textTwo(),
            slider(),
            const Padding(
              padding: EdgeInsetsDirectional.only(bottom: 30),
              child: ButtonWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget imageOne() {
  return SvgPicture.asset('images/on boarding 1/logoTitle.svg', height: 40);
}

Widget imageTwo() {
  return FadeIn(
    delay: const Duration(seconds: 2),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 320, start: 15),
      child: Center(
        child: SvgPicture.asset(
          'images/on boarding 1/on boarding 2.svg',
          fit: BoxFit.fitWidth,
          height: 300,
        ),
      ),
    ),
  );
}

Widget imageThree() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(top: 150),
    child: SvgPicture.asset(
      'images/on boarding 1/on boarding 1.svg',
      fit: BoxFit.fitWidth,
      height: 320,
    ),
  );
}

Widget textOne() {
  return FadeInLeft(
    from: 20,
    delay: const Duration(seconds: 2),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 220),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Text(
          'on_boarding2_title'.tr,
          style: TextStyle(
            color: ColorsApp.s,
            fontSize: 20,
            fontFamily: FontsApp.helveticaL,
          ),
        ),
      ),
    ),
  );
}

Widget textTwo() {
  return FadeInUp(
    delay: const Duration(seconds: 3),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 150),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: FadeInUp(
          delay: const Duration(seconds: 3),
          child: Text(
            'on_boarding2_subtitle'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsApp.s1,
              fontSize: 16,
              height: 1.7,
              fontFamily: FontsApp.helveticaL,
            ),
          ),
        ),
      ),
    ),
  );
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 80,
      delay: const Duration(milliseconds: 3250),
      child: Align(
        alignment: AlignmentDirectional.bottomStart,
        child: FloatingActionButton(
          backgroundColor: ColorsApp.s,
          elevation: 0,
          onPressed: () {
            SharedPreferencesController().saveOnBoarding(value: true);
            Navigator.pushReplacementNamed(context, loginScreen);
          },
          child: const Icon(
            Icons.arrow_right_alt,
            size: 30,
          ),
        ),
      ),
    );
  }
}

Widget slider() {
  return FadeInDown(
    delay: const Duration(seconds: 2),
    from: 20,
    child: Padding(
      padding: const EdgeInsetsDirectional.only(start: 150, bottom: 100),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Row(
          children: const [
            CircleAvatar(radius: 6, backgroundColor: Color(0XFF464698)),
            SizedBox(width: 10),
            CircleAvatar(radius: 6, backgroundColor: Color(0XFF9090C1)),
          ],
        ),
      ),
    ),
  );
}
