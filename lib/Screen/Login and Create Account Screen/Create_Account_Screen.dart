import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/fonts.dart';
import '../../Widget/Buttons.dart';
import '../../Widget/Menu_Choose.dart';
import '../../Widget/Text_Field_Profile.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../models/Code Country.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  List<CodeCountry> codeCountry = <CodeCountry>[
    CodeCountry(name: '970+', id: 1),
    CodeCountry(name: '972+', id: 2),
  ];

  String? selectedCodeCountry;
  late TextEditingController _phoneEditingController;
  late TapGestureRecognizer _tapGestureRecognizer;

  void _navigatorToLoginScreen() => Navigator.pushNamed(context, loginScreen);

  @override
  void initState() {
    super.initState();
    _phoneEditingController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = _navigatorToLoginScreen;
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'إنشاء حساب',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(top: 40, start: 37, end: 37),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SvgPicture.asset(
            'images/Login and Create Account/Create Account.svg',
            height: 250,
          ),
          const SizedBox(height: 67),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFieldProfile(
                    keyboardType: TextInputType.phone,
                    textEditingController: _phoneEditingController,
                    nameFiled: 'أدخل رقمك الهاتفي',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: MenuChoose(
                    function: (String? value) {
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
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
              top: 50,
              bottom: 43,
            ),
            child: Buttons(
              name: 'إنشاء حساب',
              x: 45,
              y: double.infinity,
              function: () => _performLogin(),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 40),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'ليس لديك حساب من قبل ؟ ',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontsApp.helveticaL,
                      color: ColorsApp.s1,
                    ),
                  ),
                  TextSpan(
                    recognizer: _tapGestureRecognizer,
                    text: 'تسجيل دخول',
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

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_phoneEditingController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'يرجى إدخال الرقم بشكل صحيح',
          style: TextStyle(
            fontSize: 12,
            fontFamily: FontsApp.helveticaL,
            color: ColorsApp.s3,
          ),
        ),
        padding: const EdgeInsetsDirectional.only(bottom: 330, start: 40),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return false;
  }

  Future<void> _register() async {
    /*** Get State Management ***/
    bool registered = false;
    if (registered) {
      Navigator.pushReplacementNamed(context, securityCodeScreen);
      //addInformationScreen
    }
  }
}
