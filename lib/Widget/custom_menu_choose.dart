import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/fonts.dart';
import '../constants/colors.dart';

class CustomMenuChoose extends StatelessWidget {
  const CustomMenuChoose({
    Key? key,
    required this.selectedId,
    required this.nameFiled,
    required this.list,
    required this.function,
    this.name,
    this.nameAr,
    this.icon = Icons.keyboard_arrow_down,
    this.size = 24,
    this.fontSize = 10,
  }) : super(key: key);

  final String? selectedId;
  final String nameFiled;
  final String? name;
  final String? nameAr;
  final List list;
  final IconData icon;
  final double size;

  final double fontSize;

  final Function(String? value) function;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 7.w,
        end: 5.w,
      ),
      alignment: AlignmentDirectional.center,
      width: 73.w,
      decoration: BoxDecoration(
        color: s4,
        borderRadius: BorderRadius.circular(4).w,
      ),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(4).w,
        hint: Text(
          nameFiled,
          style: TextStyle(
            fontSize: fontSize.sp,
            fontFamily: kHelveticaL,
            color: primaryColor,
          ),
        ),
        underline: const Text(''),
        isExpanded: true,
        icon: Icon(
          icon,
          color: primaryColor,
          size: size,
        ),
        dropdownColor: s4,
        style: TextStyle(
          fontSize: fontSize.sp,
          fontFamily: kHelveticaL,
          color: primaryColor,
        ),
        elevation: 0,
        value: selectedId,
        items: list
            .map(
              (dynamic list) => DropdownMenuItem<String>(
                value: list.id.toString(),
                child: name != null ?
                Text(list.name) : Text(list.nameAr),
              ),
            )
            .toList(),
        onChanged: function,
      ),
    );
  }
}
