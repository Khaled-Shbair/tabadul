import 'package:flutter/material.dart';
import 'package:tabadul/constants/colors.dart';
import '../constants/fonts.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
    required this.function,
    required this.name,
    required this.x,
    this.y = double.infinity,
    this.fontSize = 15,
    this.color = ColorsApp.s,
    this.colorFont = Colors.white,
  }) : super(key: key);
  final Function() function;
  final String name;
  final double x;
  final double y;
  final double fontSize;
  final Color color;
  final Color colorFont;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(
        name,
        style: TextStyle(
          color: colorFont,
          fontSize: fontSize,
          fontFamily: FontsApp.helveticaL,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        minimumSize: Size(y, x),
      ),
    );
  }
}
