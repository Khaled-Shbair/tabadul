import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ButtonAppBar extends StatelessWidget {
  const ButtonAppBar({
    Key? key,
    required this.function,
    required this.icon,
    this.size = 18,
    this.start = 0,
    this.end = 0,
    this.top = 0,
    this.bottom = 0,
    this.paddingEnd = 0,
    this.paddingStart = 0,
  }) : super(key: key);
  final double start;
  final double end;
  final double top;
  final double bottom;
  final double size;
  final double paddingEnd;
  final double paddingStart;
  final Function() function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        end: end,
        start: start,
        top: top,
        bottom: bottom,
      ),
      padding: EdgeInsetsDirectional.only(end: paddingEnd, start: paddingStart),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsApp.s4,
        boxShadow: [
          BoxShadow(
            color: ColorsApp.s1.withAlpha(51),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: IconButton(
        onPressed: function,
        icon: Icon(
          icon,
          size: size,
          color: ColorsApp.s,
        ),
      ),
    );
  }
}
