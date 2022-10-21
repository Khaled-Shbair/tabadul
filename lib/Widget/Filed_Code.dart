import 'package:flutter/material.dart';
import '../constants/colors.dart';

class FiledCode extends StatelessWidget {
  const FiledCode({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        autofocus: true,
        enabled: true,
        controller: textEditingController,
        focusNode: focusNode,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        cursorColor: ColorsApp.s,
        style: TextStyle(
          color: ColorsApp.s,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          hintText: '-',
          hintStyle: TextStyle(
            color: ColorsApp.s,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsetsDirectional.only(
            top: 15,
            bottom: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: ColorsApp.s4,
          filled: true,
        ),
      ),
    );
  }
}
