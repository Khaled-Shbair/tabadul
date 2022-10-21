import 'package:flutter/material.dart';
import '../constants/fonts.dart';
import '../constants/colors.dart';

class MenuChoose extends StatelessWidget {
  const MenuChoose({
    Key? key,
    required this.selectedId,
    required this.nameFiled,
    required this.list,
    required this.function,
    this.icon = Icons.keyboard_arrow_down,
    this.size = 24,
    this.paddingEnd = 20,
    this.paddingStart = 20,
    this.marginEnd = 0,
    this.fontSize = 10,
  }) : super(key: key);

  final String? selectedId;
  final String nameFiled;
  final List list;
  final IconData icon;
  final double size;
  final double paddingEnd;
  final double paddingStart;
  final double marginEnd;
  final double fontSize;

  final Function(String? value) function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      padding: EdgeInsetsDirectional.only(start: paddingStart, end: paddingEnd),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorsApp.s4, borderRadius: BorderRadius.circular(4)),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(10),
        hint: Text(
          nameFiled,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s,
          ),
        ),
        menuMaxHeight: 150,
        underline: const Text(''),
        isExpanded: true,
        icon: Icon(
          icon,
          color: ColorsApp.s,
          size: size,
        ),
        dropdownColor: ColorsApp.s4,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: FontsApp.helveticaL,
          color: ColorsApp.s,
        ),
        elevation: 0,
        value: selectedId,
        items: list
            .map(
              (dynamic list) => DropdownMenuItem<String>(
                child: Text(list.name),
                value: list.id.toString(),
              ),
            )
            .toList(),
        onChanged: function,
      ),
    );
  }
}
