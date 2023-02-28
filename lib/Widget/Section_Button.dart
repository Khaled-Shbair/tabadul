import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

class SectionButton extends StatelessWidget {
  const SectionButton({
    Key? key,
    required this.pathImage,
    required this.nameSection,
    required this.function,
  }) : super(key: key);

  final String nameSection;
  final String pathImage;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFFF1F1F9),
        shadowColor: const Color(0XFF464698),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: SvgPicture.asset(pathImage),
          ),
          Text(
            nameSection,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 13,
              fontFamily: kHelveticaL,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
