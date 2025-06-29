import 'config/all_imports.dart';

final AppRouteObserver appRouteObserver = AppRouteObserver();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initModule();
  runApp(
    EasyLocalization(
      path: ManagerAssets.languages,
      fallbackLocale: Locale(LocaleConstants.ar),
      supportedLocales: [Locale(LocaleConstants.ar)],
      startLocale: Locale(LocaleConstants.ar),
      child: MyApp(),
    ),
  );
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
        return MaterialApp(
          navigatorKey: Routes.navigatorKey,
          debugShowCheckedModeBanner: false,
          themeMode: themeService.getThemeMode(),
          theme: themeService.getThemeData(),
          darkTheme: managerDarkTheme(),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: RouteMiddleware.initialRoute(),
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
        );
      },
    );
  }
}
