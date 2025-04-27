import '/config/all_imports.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.onBoardingScreen:
        initOnBoarding();
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<OnBoardingBloc>(),
            child: OnBoardingScreen(),
          ),
        );
      case Routes.loginScreen:
        initLogin();
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<LoginBloc>(),
            child: LoginScreen(),
          ),
        );
      case Routes.createAccountScreen:
        initCreateAccount();
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<CreateAccountBloc>(),
            child: CreateAccountScreen(),
          ),
        );
      case Routes.securityCodeScreen:
        initSecurityCode();
        List arguments = settings.arguments as List;
        String route = arguments[0] as String;
        String phoneNumber = arguments[1] as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<SecurityCodeBloc>()
              ..add(ResendSecurityCode(phoneNumber)),
            child: SecurityCodeScreen(route: route, phoneNumber: phoneNumber),
          ),
        );
      case Routes.logoutScreen:
        initLogoutController();
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => instance<LogoutBloc>(),
            child: LogoutScreen(),
          ),
        );
      case Routes.mainScreen:
        initMainController();
        return MaterialPageRoute(builder: (context) => MainScreen());

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
