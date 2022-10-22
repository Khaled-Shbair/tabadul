import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../constants/strings.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import 'package:get/get.dart';

class OnBoarding1Screen extends StatefulWidget {
  const OnBoarding1Screen({Key? key}) : super(key: key);

  @override
  State<OnBoarding1Screen> createState() => _OnBoarding1ScreenState();
}

class _OnBoarding1ScreenState extends State<OnBoarding1Screen> {
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
            SvgPicture.asset('images/on boarding 1/logoTitle.svg', height: 40),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 120),
              child: SvgPicture.asset(
                'images/on boarding 1/1.svg',
                fit: BoxFit.fitWidth,
                height: 200,
              ),
            ),
            phoneOne(),
            phoneTwo(),
            man(),
            woman(),
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

Widget phoneOne() {
  return SlideInDown(
    delay: const Duration(seconds: 2),
    from: 20,
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 320, start: 190),
      child: Center(
        child: SvgPicture.asset(
          'images/on boarding 1/phone1.svg',
          fit: BoxFit.fitWidth,
          height: 230,
        ),
      ),
    ),
  );
}

Widget phoneTwo() {
  return SlideInUp(
    from: 20,
    delay: const Duration(seconds: 2),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 320, end: 167),
      child: Center(
        child: SvgPicture.asset(
          'images/on boarding 1/phone2.svg',
          fit: BoxFit.fitWidth,
          height: 230,
        ),
      ),
    ),
  );
}

Widget man() {
  return SlideInLeft(
    from: 250,
    delay: const Duration(seconds: 2),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 295, start: 110),
      child: Center(
        child: SvgPicture.asset(
          'images/on boarding 1/man.svg',
          width: 100,
          height: 190,
        ),
      ),
    ),
  );
}

Widget woman() {
  return SlideInRight(
    from: 250,
    delay: const Duration(seconds: 2),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 295, end: 160),
      child: Center(
        child: SvgPicture.asset(
          'images/on boarding 1/woman.svg',
          width: 100,
          height: 190,
        ),
      ),
    ),
  );
}

Widget textOne() {
  return FadeInLeft(
    from: 20,
    delay: const Duration(seconds: 3),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 340),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Text(
          'fair_return_policy'.tr,
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
  return FadeInDown(
    delay: const Duration(seconds: 4),
    from: 20,
    child: Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 250),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: FadeInUp(
          delay: const Duration(seconds: 4),
          child: Text(
            'on_boarding1'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsApp.s1,
              fontSize: 16,
              height: 1.5,
              fontFamily: FontsApp.helveticaL,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget slider() {
  return FadeInDown(
    delay: const Duration(seconds: 3),
    from: 20,
    child: Padding(
      padding: const EdgeInsetsDirectional.only(start: 150, bottom: 160),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Row(
          children: const [
            CircleAvatar(radius: 6, backgroundColor: ColorsApp.s2),
            SizedBox(width: 10),
            CircleAvatar(radius: 6, backgroundColor: ColorsApp.s),
          ],
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
      delay: const Duration(seconds: 4),
      from: 5,
      child: Align(
        alignment: AlignmentDirectional.bottomStart,
        child: FloatingActionButton(
          backgroundColor: ColorsApp.s,
          elevation: 0,
          onPressed: () =>
              Navigator.pushReplacementNamed(context, onBoarding2Screen),
          child: const Icon(Icons.arrow_right_alt, size: 30),
        ),
      ),
    );
  }
}
