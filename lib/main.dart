import 'package:tabadul/core/bloc_observer/app_bloc_observer.dart';

import 'config/all_imports.dart';
final AppRouteObserver appRouteObserver = AppRouteObserver();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initModule();
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) : themeService = ThemeService();

  final ThemeService themeService;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        AppConstants.widthDevice,
        AppConstants.heightDevice,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: Routes.navigatorKey,
          debugShowCheckedModeBanner: false,
          themeMode: themeService.getThemeMode(),
          theme: themeService.getThemeData(),
          darkTheme: managerDarkTheme(),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: RouteMiddleware.initialRoute(),
          translations: Translation(),
          locale: Locale('ar'),
          // locale: Locale(
          //   SharedPreferencesController.getString(
          //     SharedPreferenceConstants.language,
          //   ),
          // ),
          // fallbackLocale: Locale(
          //   SharedPreferencesController.getString(
          //     SharedPreferenceConstants.language,
          //   ),
          // ),
        );
      },
    );
  }
}
