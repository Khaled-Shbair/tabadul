import '/config/all_imports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    this.keyboardType = TextInputType.datetime,
    required this.hintText,
    this.maxLength,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.contentPadding,
    this.errorBorder,
    this.textInputAction,
    this.onFieldSubmitted,
    this.helperText,
    this.helperStyle,
    this.errorText,
    this.textInputStyle,
    this.expands = false,
    this.autofocus = false,
    this.textAlign = TextAlign.start,
  });

  final TextInputType keyboardType;
  final TextStyle? textInputStyle;
  final bool expands;
  final bool autofocus;
  final String hintText;
  final String? errorText;
  final String? helperText;
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final int? maxLength;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextAlign textAlign;
  final TextStyle? helperStyle;
  final EdgeInsetsDirectional? contentPadding;
  final InputBorder? errorBorder;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      onChanged: onChanged,
      focusNode: focusNode,
      maxLength: maxLength,
      textAlign: textAlign,
      expands: expands,
      autofocus: autofocus,
      keyboardType: keyboardType,
      cursorColor: context.theme.primaryColor,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: AutovalidateMode.onUnfocus,
      cursorRadius: Radius.circular(ManagerRadius.r15),
      style: textInputStyle ??
          context.theme.inputDecorationTheme.hintStyle?.copyWith(
            color: context.theme.primaryColor,
          ),
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        isDense: true,
        counterText: '',
        helperText: helperText,
        helperStyle: helperStyle,
        contentPadding:
            contentPadding ?? context.theme.inputDecorationTheme.contentPadding,
        hintStyle: context.theme.inputDecorationTheme.hintStyle,
        errorMaxLines: context.theme.inputDecorationTheme.errorMaxLines,
        border: context.theme.inputDecorationTheme.border,
        fillColor: context.theme.inputDecorationTheme.fillColor,
        filled: context.theme.inputDecorationTheme.filled,
        errorStyle: context.theme.inputDecorationTheme.errorStyle,
        errorBorder:
            errorBorder ?? context.theme.inputDecorationTheme.errorBorder,
      ),
    );
  }
}
