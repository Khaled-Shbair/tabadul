import '/config/all_imports.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainScreen:
        initMainController();
        return MaterialPageRoute(builder: (context) => MainScreen());
      // case Routes.securityCodeScreen:
      //   final navigator = settings.arguments as String;
      //   return MaterialPageRoute(
      //       builder: (context) => SecurityCodeScreen(navigator: navigator));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.noRouteFound),
        ),
        body: Center(
          child: Text(ManagerStrings.noRouteFound),
        ),
      ),
    );
  }
}
