import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

class TextFieldProfile extends StatelessWidget {
  const TextFieldProfile({
    Key? key,
    required this.textEditingController,
    required this.keyboardType,
    required this.nameFiled,
    this.errorText,
    this.maxLength,
    this.suffixIcon = Icons.create,
    this.sizeSuffixIcon = 0,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String nameFiled;
  final String? errorText;
  final IconData suffixIcon;
  final double sizeSuffixIcon;
  final TextEditingController textEditingController;
final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      cursorColor: ColorsApp.s,
      keyboardType: keyboardType,
      controller: textEditingController,
      style: TextStyle(
        fontSize: 12,
        fontFamily: FontsApp.helveticaL,
        color: ColorsApp.s.withAlpha(204),
      ),
      decoration: InputDecoration(
        counterText: '',
        contentPadding: const EdgeInsetsDirectional.only(
          top: 9,
          bottom: 10,
          start: 20,
        ),
        suffixIcon: Icon(
          suffixIcon,
          size: sizeSuffixIcon,
          color: ColorsApp.s,
        ),
        hintText: nameFiled,
        hintStyle: TextStyle(
          fontSize: 10,
          fontFamily: FontsApp.helveticaL,
          color: ColorsApp.s.withAlpha(204),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        fillColor: ColorsApp.s4,
        filled: true,
        errorText: errorText,
      ),
    );
  }
}
