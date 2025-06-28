import '/config/all_imports.dart';

class CustomFiledSecurityCode extends StatelessWidget {
  const CustomFiledSecurityCode({
    required this.phoneNumber,
    super.key,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SecurityCodeBloc>();
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w7,
        end: ManagerWidth.w10,
      ),
      child: Row(
        children: [
          _CustomFiledCode(
            textEditingController: controller.firstCode,
            focusNode: controller.firstFocusNode,
            onChanged: (String value) {
              if (value.isNotEmpty) {
                controller.secondFocusNode.requestFocus();
              }
            },
          ),
          horizontalSpace(ManagerWidth.w5),
          _CustomFiledCode(
            textEditingController: controller.secondCode,
            focusNode: controller.secondFocusNode,
            onChanged: (String value) {
              if (value.isNotEmpty) {
                controller.thirdFocusNode.requestFocus();
              } else {
                controller.firstFocusNode.requestFocus();
              }
            },
          ),
          horizontalSpace(ManagerWidth.w5),
          _CustomFiledCode(
            textEditingController: controller.thirdCode,
            focusNode: controller.thirdFocusNode,
            onChanged: (String value) {
              if (value.isNotEmpty) {
                controller.fourthFocusNode.requestFocus();
              } else {
                controller.secondFocusNode.requestFocus();
              }
            },
          ),
          horizontalSpace(ManagerWidth.w5),
          _CustomFiledCode(
            textEditingController: controller.fourthCode,
            focusNode: controller.fourthFocusNode,
            onChanged: (String value) {
              if (value.isNotEmpty) {
                controller.fifthFocusNode.requestFocus();
              } else {
                controller.thirdFocusNode.requestFocus();
              }
            },
          ),
          horizontalSpace(ManagerWidth.w5),
          _CustomFiledCode(
            textEditingController: controller.fifthCode,
            focusNode: controller.fifthFocusNode,
            onChanged: (String value) {
              if (value.isNotEmpty) {
                controller.sixthFocusNode.requestFocus();
              } else {
                controller.fourthFocusNode.requestFocus();
              }
            },
          ),
          horizontalSpace(ManagerWidth.w5),
          _CustomFiledCode(
            textEditingController: controller.sixthCode,
            focusNode: controller.sixthFocusNode,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (p0) {
              String code = controller.firstCode.text +
                  controller.secondCode.text +
                  controller.thirdCode.text +
                  controller.fourthCode.text +
                  controller.fifthCode.text +
                  controller.sixthCode.text;
              controller.sixthFocusNode.unfocus();
              controller.add(VerifySecurityCode(code, phoneNumber));
            },
            onChanged: (String value) {
              if (value.isEmpty) {
                controller.fifthFocusNode.requestFocus();
              } else {
                String code = controller.firstCode.text +
                    controller.secondCode.text +
                    controller.thirdCode.text +
                    controller.fourthCode.text +
                    controller.fifthCode.text +
                    controller.sixthCode.text;
                controller.sixthFocusNode.unfocus();
                controller.add(VerifySecurityCode(code, phoneNumber));
              }
            },
          ),
        ],
      ),
    );
  }
}

class _CustomFiledCode extends StatelessWidget {
  const _CustomFiledCode({
    required this.textEditingController,
    required this.focusNode,
    required this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String value) onChanged;
  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        textEditingController: textEditingController,
        autofocus: true,
        focusNode: focusNode,
        onChanged: onChanged,
        hintTextStyle: TextStyle(
          color: ManagerColors.primaryColor,
          fontWeight: ManagerFontWeight.bold,
          fontSize: ManagerFontsSizes.f20,
          height: 1.5,
        ),
        maxLength: 1,
        textAlign: TextAlign.center,
        textInputStyle: TextStyle(
          fontSize: ManagerFontsSizes.f17,
          color: context.theme.primaryColor,
          fontWeight: ManagerFontWeight.bold,
        ),
        contentPadding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h7,
          bottom: ManagerHeight.h7,
        ),
      ),
    );
  }
}
