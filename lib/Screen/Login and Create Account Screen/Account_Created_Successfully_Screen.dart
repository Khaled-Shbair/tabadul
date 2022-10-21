import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';

import '../../constants/fonts.dart';
import '../../constants/strings.dart';

class AccountCreatedSuccessfullyScreen extends StatefulWidget {
  const AccountCreatedSuccessfullyScreen({Key? key}) : super(key: key);

  @override
  State<AccountCreatedSuccessfullyScreen> createState() =>
      _AccountCreatedSuccessfullyScreenState();
}

class _AccountCreatedSuccessfullyScreenState
    extends State<AccountCreatedSuccessfullyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 37, end: 37, bottom: 10),
        child: Stack(
          children: const [
            ImageTwoWidget(),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 220),
              child: ImageOneWidget(),
            ),
            TextWidget(),
            ButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class ImageOneWidget extends StatelessWidget {
  const ImageOneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: const Duration(seconds: 2),
      child: Center(
        child: SvgPicture.asset(
          'images/Login and Create Account/ImageOne.svg',
          fit: BoxFit.fitHeight,
          width: 380,
        ),
      ),
    );
  }
}

class ImageTwoWidget extends StatelessWidget {
  const ImageTwoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(seconds: 3),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 120, start: 20, end: 15),
        child: SvgPicture.asset(
          'images/Login and Create Account/ImageTwo.svg',
          fit: BoxFit.fitWidth,
          height: 250,
          alignment: AlignmentDirectional.bottomCenter,
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(seconds: 4),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 140),
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Text(
            'لقد تم إنشاء الحساب\n بنجاح',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsApp.s1,
              fontSize: 18,
              height: 1.8,
              fontFamily: FontsApp.helveticaL,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: const Duration(seconds: 5),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 50, end: 285),
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: FloatingActionButton(
            child: const Icon(Icons.arrow_right_alt, size: 30),
            backgroundColor: ColorsApp.s,
            elevation: 0,
            onPressed: () =>
                Navigator.pushReplacementNamed(context, menuScreen),
          ),
        ),
      ),
    );
  }
}
