import '/config/all_imports.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.onBoardingScreen:
        initOnBoarding();
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.onBoardingScreen),
          builder: (context) => BlocProvider(
            create: (context) => instance<OnBoardingBloc>(),
            child: OnBoardingScreen(),
          ),
        );
      case Routes.loginScreen:
        initLogin();
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.loginScreen),
          builder: (context) => const LoginScreen(),
        );
      case Routes.createAccountScreen:
        initCreateAccount();
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.createAccountScreen),
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
          settings: RouteSettings(name: Routes.securityCodeScreen),
          builder: (context) => BlocProvider(
            create: (context) => instance<SecurityCodeBloc>()
              ..add(ResendSecurityCode(phoneNumber)),
            child: SecurityCodeScreen(route: route, phoneNumber: phoneNumber),
          ),
        );
      case Routes.addPersonalInformationScreen:
        initAddPersonalInformation();
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.addPersonalInformationScreen),
          builder: (context) => BlocProvider(
            create: (context) => instance<AddPersonalInformationBloc>(),
            child: AddPersonalInformationScreen(phoneNumber: phoneNumber),
          ),
        );
      case Routes.accountCreatedSuccessfullyScreen:
        return MaterialPageRoute(
          settings:
              RouteSettings(name: Routes.accountCreatedSuccessfullyScreen),
          builder: (context) => AccountCreatedSuccessfullyScreen(),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.mainScreen),
          builder: (context) => MainScreen(),
        );
      case Routes.homeScreen:
        initMain();
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.homeScreen),
          builder: (context) => BlocProvider(
            create: (context) => instance<MainBloc>(),
            child: CustomMainScreen(),
          ),
        );
      case Routes.logoutScreen:
        initLogout();
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.logoutScreen),
          builder: (context) => BlocProvider(
            create: (context) => instance<LogoutBloc>(),
            child: LogoutScreen(),
          ),
        );
      case Routes.infoScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.infoScreen),
          builder: (context) => InfoScreen(),
        );
      case Routes.editProfileScreen:
        initEditProfile();
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.editProfileScreen),
          builder: (context) => BlocProvider(
            create: (context) => instance<EditProfileBloc>(),
            child: EditProfileScreen(),
          ),
        );
      case Routes.shopAndAddProductScreen:
        initShopAndAddProduct();
        var arguments = settings.arguments as List;
        String nameDepartment = arguments[0] as String;
        String tableName = arguments[1] as String;
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.shopAndAddProductScreen),
          builder: (context) => ShopAndAddProductsScreen(
            nameDepartment: nameDepartment,
            tableName: tableName,
          ),
        );
      case Routes.addProductScreen:
        initAddProduct();
        var arguments = settings.arguments as List;
        String tableName = arguments[0] as String;
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.shopAndAddProductScreen),
          builder: (context) => BlocProvider(
            create: (context) => instance<AddProductBloc>(),
            child: AddProductScreen(tableName: tableName),
          ),
        );
      case Routes.addedProductSuccessfullyScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.addedProductSuccessfullyScreen),
          builder: (context) => const AddedProductSuccessfullyScreen(),
        );
      case Routes.answerIsYesScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.answerIsYesScreen),
          builder: (context) => const AnswerIsYesScreen(),
        );
      case Routes.answerIsNoScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.answerIsNoScreen),
          builder: (context) => const AnswerIsNoScreen(),
        );
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
