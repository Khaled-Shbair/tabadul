import '/config/all_imports.dart';

class CustomEnterPhoneNumberFiled extends StatelessWidget {
  const CustomEnterPhoneNumberFiled({
    required this.phone,
    required this.codesCountry,
    required this.function,
    required this.selectedCodeCountry,
    required this.formKey,
    this.errorText,
    super.key,
  });

  final TextEditingController phone;
  final String selectedCodeCountry;
  final List<CodeCountryModel> codesCountry;
  final Function(String?) function;
  final String? errorText;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: CustomTextField(
              validator: (v) {
                return Validator.phoneNumberValidator(v);
              },
              errorText: errorText,
              helperText: ' ',
              helperStyle: context.theme.inputDecorationTheme.errorStyle,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (v) =>
                  context.read<LoginBloc>().add(LoginProcess()),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ManagerColors.transparent),
              ),
              textEditingController: phone,
              keyboardType: TextInputType.datetime,
              maxLength: AppConstants.maxLengthOfPhoneNumber,
              hintText: ManagerStrings.enterPhoneNumber,
            ),
          ),
          horizontalSpace(ManagerWidth.w8),
          CustomMenuChooseCodeCountry(
            function: function,
            selectedId: selectedCodeCountry,
            list: codesCountry,
          ),
        ],
      ),
    );
  }
}
