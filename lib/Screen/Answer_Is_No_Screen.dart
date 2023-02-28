import 'package:flutter/material.dart';
import 'package:tabadul/constants/fonts.dart';

import '../Widget/custom_circle_button.dart';
import '../Widget/custom_button.dart';
import '../constants/colors.dart';
import '../constants/routes.dart';

class AnswerIsNoScreen extends StatelessWidget {
  const AnswerIsNoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:colorWhite ,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 78,
        leading: CustomCircleButton(
          start: 40,
          paddingStart: 5,
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(start: 37, end: 37, top: 185),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(
            'حدد الوقت الذي تريده خلال 24 ساعة\nفقط',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.8,
              fontSize: 20,
              fontFamily: kHelveticaL,
              color: s1,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TextFieldTime(),
              SizedBox(width: 10),
              TextFieldTime(),
              SizedBox(width: 18),
              Text(
                ':',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF464698),
                ),
              ),
              SizedBox(width: 18),
              TextFieldTime(),
              SizedBox(width: 10),
              TextFieldTime(),
            ],
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 60, start: 5, end: 5),
            child: CustomButton(
              name: 'تم',
              x: 50,
              y: 150,
              function: () => Navigator.pushNamed(context, waitForPickupScreen),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldTime extends StatelessWidget {
  const TextFieldTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.datetime,
      maxLength: 1,
      textAlign: TextAlign.center,
      cursorColor: primaryColor,
      style: const TextStyle(
        fontSize: 55,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 80, maxWidth: 62),
        contentPadding: const EdgeInsetsDirectional.only(bottom: 10),
        counterText: '',
        hintText: '0',
        hintStyle: const TextStyle(
          fontSize: 55,
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
        filled: true,
        fillColor: s4,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
