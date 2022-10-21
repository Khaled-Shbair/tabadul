import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/strings.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../Widget/Button_AppBar.dart';
import '../../Widget/Buttons.dart';
import '../../Widget/Filed_Code.dart';

class SecurityCodeScreen extends StatefulWidget {
  const SecurityCodeScreen({Key? key}) : super(key: key);

  @override
  State<SecurityCodeScreen> createState() => _SecurityCodeScreenState();
}

class _SecurityCodeScreenState extends State<SecurityCodeScreen> {
  late TextEditingController _firstCodeTextController;

  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;

  late TextEditingController _fourthCodeTextController;
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;
  String code = '';

  @override
  void initState() {
    super.initState();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
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
          'تسجيل الدخول',
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
            ' لقد أرسلنا لك رسالة نصية قصيرة\n تحتوي على الرمز سيتم تفعيلها تلقائيا',
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
              const SizedBox(width: 10),
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
              const SizedBox(width: 10),
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
              const SizedBox(width: 10),
              FiledCode(
                textEditingController: _fourthCodeTextController,
                focusNode: _fourthFocusNode,
                onChanged: (String value) {
                  if (value.isEmpty) {
                    _thirdFocusNode.requestFocus();
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
              name: 'إعادة إرسال الرمز',
              x: 50,
              y: double.infinity,
              function: () {
                // Navigator.pushReplacementNamed(context, '/MenuScreen');
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
        _fourthCodeTextController.text.isNotEmpty) {
      getCode();
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'يرجى إدخال الرمز بشكل صحيح',
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
    return false;
  }

  void getCode() {
    code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
  }

  Future<void> _resetCode() async {
    Navigator.pushReplacementNamed(context, addInformationScreen);
  }
}
