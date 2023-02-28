import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.colorIcon,
    required this.icon,
    required this.function,
    this.sizeIcon = 24,
  }) : super(key: key);
  final double height;
  final double width;
  final Color color;
  final Color colorIcon;
  final IconData icon;
  final double sizeIcon;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color:  primaryColor.withAlpha(41),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: colorIcon,
          size: sizeIcon,
        ),
        onPressed: function,
      ),
    );
  }
}
