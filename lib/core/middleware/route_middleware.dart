import '/config/all_imports.dart';

class RouteMiddleware {
  static final _sharedPref = instance<SharedPreferencesController>();

  static String initialRoute() {
    return Routes.splashScreen;
  }

  static String goAfterSplash() {
    String route = _sharedPref.getBool(SharedPreferenceKeys.viewOnBoarding)
        ? _sharedPref.getBool(SharedPreferenceKeys.loggedIn)
            ? Routes.mainScreen
            : Routes.loginScreen
        : Routes.onBoardingScreen;
    return route;
  }
}
