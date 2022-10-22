import '../../Widget/Button_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Widget/Filed_Code.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../Widget/Buttons.dart';
import 'package:get/get.dart';

class SecurityCodeScreen extends StatefulWidget {
  const SecurityCodeScreen({
    Key? key,
    required this.navigator,
  }) : super(key: key);
  final String navigator;

  @override
  State<SecurityCodeScreen> createState() => _SecurityCodeScreenState();
}

class _SecurityCodeScreenState extends State<SecurityCodeScreen> {
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;
  late TextEditingController _fifthCodeTextController;
  late TextEditingController _sixthCodeTextController;
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;
  late FocusNode _fifthFocusNode;
  late FocusNode _sixthFocusNode;
  String code = '';

  @override
  void initState() {
    super.initState();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();
    _fifthCodeTextController = TextEditingController();
    _sixthCodeTextController = TextEditingController();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
    _fifthFocusNode = FocusNode();
    _sixthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();
    _fifthCodeTextController.dispose();
    _sixthCodeTextController.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    _fifthFocusNode.dispose();
    _sixthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 78,
        leading: ButtonAppBar(
          start: 40,
          paddingStart: 5,
          icon: Icons.arrow_back_ios,
          function: () => Navigator.pop(context),
        ),
        title: Text(
          'login'.tr,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(top: 52, start: 37, end: 37),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            'images/Login and Create Account/Security code.svg',
            height: 250,
          ),
          const SizedBox(height: 30),
          Text(
            'security_code_subtitle'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.8,
              color: ColorsApp.s1,
              fontWeight: FontWeight.bold,
              fontFamily: FontsApp.helveticaL,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FiledCode(
                textEditingController: _firstCodeTextController,
                focusNode: _firstFocusNode,
                onChanged: (String value) {
                  if (value.isNotEmpty) {
                    _secondFocusNode.requestFocus();
                  }
                },
              ),
              const SizedBox(width: 5),
              FiledCode(
                textEditingController: _secondCodeTextController,
                focusNode: _secondFocusNode,
                onChanged: (String value) {
                  if (value.isNotEmpty) {
                    _thirdFocusNode.requestFocus();
                  } else {
                    _firstFocusNode.requestFocus();
                  }
                },
              ),
              const SizedBox(width: 5),
              FiledCode(
                textEditingController: _thirdCodeTextController,
                focusNode: _thirdFocusNode,
                onChanged: (String value) {
                  if (value.isNotEmpty) {
                    _fourthFocusNode.requestFocus();
                  } else {
                    _secondFocusNode.requestFocus();
                  }
                },
              ),
              const SizedBox(width: 5),
              FiledCode(
                textEditingController: _fourthCodeTextController,
                focusNode: _fourthFocusNode,
                onChanged: (String value) {
                  if (value.isNotEmpty) {
                    _fifthFocusNode.requestFocus();
                  } else {
                    _thirdFocusNode.requestFocus();
                  }
                },
              ),
              const SizedBox(width: 5),
              FiledCode(
                textEditingController: _fifthCodeTextController,
                focusNode: _fifthFocusNode,
                onChanged: (String value) {
                  if (value.isNotEmpty) {
                    _sixthFocusNode.requestFocus();
                  } else {
                    _fourthFocusNode.requestFocus();
                  }
                },
              ),
              const SizedBox(width: 5),
              FiledCode(
                textEditingController: _sixthCodeTextController,
                focusNode: _sixthFocusNode,
                onChanged: (String value) {
                  if (value.isEmpty) {
                    _fifthFocusNode.requestFocus();
                  } else {
                    _performResetCode();
                  }
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 10,
              end: 10,
              top: 55,
            ),
            child: Buttons(
              name: 'resend_code'.tr,
              x: 50,
              y: double.infinity,
              function: () {
                //TODO: resend code another
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performResetCode() async {
    if (_checkCode()) {
      await _resetCode();
    }
  }

  bool _checkCode() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty &&
        _fifthCodeTextController.text.isNotEmpty &&
        _sixthCodeTextController.text.isNotEmpty) {
      getCode();
      return true;
    }
    snackBar();
    return false;
  }

  void getCode() {
    code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text +
        _fifthCodeTextController.text +
        _sixthCodeTextController.text;
  }

  Future<void> _resetCode() async {
    Navigator.pushReplacementNamed(context, widget.navigator);
  }

  void snackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'please_enter_code_correctly'.tr,
          style: TextStyle(
            fontSize: 12,
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s3,
          ),
        ),
        padding: const EdgeInsetsDirectional.only(bottom: 300, start: 50),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
