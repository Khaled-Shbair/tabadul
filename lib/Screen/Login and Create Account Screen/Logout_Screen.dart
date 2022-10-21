import '../../constants/fonts.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import 'package:flutter/material.dart';
import '../../Widget/Button_AppBar.dart';
import '../../shared_preference/pref_controller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تسجيل خروج',
          style: TextStyle(
            fontSize: 20,
            fontFamily: FontsApp.helveticaLNeeL,
            color: ColorsApp.s,
          ),
        ),
        leadingWidth: 78,
        leading: ButtonAppBar(
          start: 40,
          paddingStart: 5,
          icon: Icons.arrow_back_ios,
          function: () => Navigator.pop(context),
        ),
        actions: [
          ButtonAppBar(
            end: 40,
            icon: Icons.menu,
            function: () => ZoomDrawer.of(context)!.toggle(),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsetsDirectional.only(start: 69, end: 69),
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsApp.s,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: ColorsApp.s6.withAlpha(153),
                offset: const Offset(2, 60),
                spreadRadius: -40,
              ),
              BoxShadow(
                color: ColorsApp.s5.withAlpha(255),
                offset: const Offset(0, 30),
                spreadRadius: -20,
              ),
            ],
          ),
          child: ListView(
            padding:
                const EdgeInsetsDirectional.only(start: 30, end: 30, top: 30),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Text(
                'هل تريد تسجيل الخروج\nمن الحساب ؟ ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontsApp.helveticaLNeeL,
                ),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'إلغاء',
                  style: TextStyle(
                    fontSize: 15,
                    color: ColorsApp.s,
                    fontFamily: FontsApp.helveticaLNeeL,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => logout(),
                child: Text(
                  'تسجيل خروج',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: FontsApp.helveticaLNeeL,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout() async {
    bool cleared = false;
    if (cleared) {
      Navigator.pushReplacementNamed(context, loginScreen);
    }
  }
}
