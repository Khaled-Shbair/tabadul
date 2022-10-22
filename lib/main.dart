import 'package:firebase_core/firebase_core.dart';
import 'shared_preference/pref_controller.dart';
import 'package:flutter/material.dart';
import 'languages/translation.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController().getInstance();
  await Firebase.initializeApp();
  runApp(MyApp(appRoutes: AppRoutes()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRoutes}) : super(key: key);
  final AppRoutes appRoutes;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Translation(),
      locale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.onGenerateRoute,
    );
  }
}
