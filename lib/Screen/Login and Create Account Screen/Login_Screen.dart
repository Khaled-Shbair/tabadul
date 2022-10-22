import '../../Widget/Text_Field_Profile.dart';
import '../../getX/phone_auth_getX.dart';
import '../../models/Code Country.dart';
import '../../Widget/Menu_Choose.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/strings.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../Widget/Buttons.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final PhoneAuthGetX _phone = Get.put(PhoneAuthGetX());
  List<CodeCountry> codeCountry = <CodeCountry>[
    CodeCountry(name: '970+', id: 1),
    CodeCountry(name: '972+', id: 2),
  ];

  String? selectedCodeCountry;
  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _phoneEditingController;
  String? value;

  void _navigatorToCreateScreen() =>
      Navigator.pushNamed(context, createAccountScreen);

  @override
  void initState() {
    super.initState();
    _phoneEditingController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = _navigatorToCreateScreen;
  }

  @override
  void dispose() {
    _phoneEditingController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorScaffold,
      appBar: appBar(),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(top: 52, start: 37, end: 37),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            'images/Login and Create Account/Log in.svg',
            height: 270,
          ),
          const SizedBox(height: 67),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFieldProfile(
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  textEditingController: _phoneEditingController,
                  nameFiled: 'enter_phone_number'.tr,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: MenuChoose(
                  function: (value) {
                    if (value != null) {
                      setState(() {
                        selectedCodeCountry = value;
                      });
                    }
                  },
                  paddingEnd: 10,
                  fontSize: 15,
                  paddingStart: 10,
                  selectedId: selectedCodeCountry,
                  list: codeCountry,
                  nameFiled: codeCountry[0].name,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
              top: 50,
              bottom: 43,
            ),
            child: Buttons(
              name: 'login'.tr,
              x: 45,
              y: double.infinity,
              function: () => _performResetCode(),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 40),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'do_not_have_an_account'.tr,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontsApp.helveticaL,
                      color: ColorsApp.s1,
                    ),
                  ),
                  TextSpan(
                    recognizer: _tapGestureRecognizer,
                    text: 'create_account'.tr,
                    style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      fontFamily: FontsApp.helveticaL,
                      color: ColorsApp.s,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'login'.tr,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: FontsApp.helveticaL,
          color: ColorsApp.s,
        ),
      ),
    );
  }

  Future<void> _performResetCode() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_phoneEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar();
    return false;
  }

  Future<void> _login() async {
    await _phone.submitPhoneNumber(_phoneEditingController.text);
    navigator();
  }

  void navigator() =>
      Navigator.pushNamed(context, securityCodeScreen, arguments: menuScreen);

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          'يرجى إدخال الرقم بشكل صحيح',
          style: TextStyle(
            fontSize: 12,
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s3,
          ),
        ),
        padding: const EdgeInsetsDirectional.only(bottom: 280, start: 50),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
