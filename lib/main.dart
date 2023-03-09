import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/colors.dart';
import 'constants/fonts.dart';
import 'getX/profile_getx_controller.dart';
import 'shared_preference/pref_controller.dart';
import 'package:flutter/material.dart';
import 'languages/translation.dart';
import 'package:get/get.dart';
import 'utils/bindings.dart';
import 'app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefController().initializeApp();
  await Firebase.initializeApp();
  runApp(MyApp(appRoutes: AppRoutes()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.appRoutes}) : super(key: key);
  final AppRoutes appRoutes;
  final ProfileGetxController profileGetxController =
      Get.put(ProfileGetxController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
//      designSize: const Size(360, 690),
      designSize: const Size(360, 760),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: Translation(),
          locale: const Locale('ar'),
          fallbackLocale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoutes.onGenerateRoute,
          initialBinding: InitialBinding(),
          theme: ThemeData(
            scaffoldBackgroundColor:colorWhite ,

            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontSize: 17.sp,
                fontFamily: kHelveticaL,
                color: primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
