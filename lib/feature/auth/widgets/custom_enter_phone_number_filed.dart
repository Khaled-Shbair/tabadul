import '/config/all_imports.dart';

class CustomEnterPhoneNumberFiled extends StatelessWidget {
  const CustomEnterPhoneNumberFiled({
    this.errorMessage,
    required this.controller,
    required this.onFieldSubmitted,
    super.key,
  });

  final String? errorMessage;
  final TextEditingController controller;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: CustomTextField(
        validator: (v) {
          return Validator.phoneNumberValidator(v);
        },
        errorText: errorMessage,
        helperText: ' ',
        helperStyle: context.theme.inputDecorationTheme.errorStyle,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: onFieldSubmitted,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ManagerColors.transparent),
        ),
        textEditingController: controller,
        keyboardType: TextInputType.datetime,
        maxLength: AppConstants.maxLengthOfPhoneNumber,
        hintText: ManagerStrings.enterPhoneNumber,
      ),
    );
  }
}
