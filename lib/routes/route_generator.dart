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
        initAuth();
        initLogin();
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.loginScreen),
          builder: (context) => BlocProvider<LoginBloc>(
            create: (context) => instance<LoginBloc>(),
            child: const LoginScreen(),
          ),
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
        initAuth();
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
        initShopProducts();
        var arguments = settings.arguments as List;
        String nameDepartment = arguments[0] as String;
        String tableName = arguments[1] as String;
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.shopAndAddProductScreen),
          builder: (context) => BlocProvider(
            create: (context) => instance<ShopProductsBloc>(),
            child: ShopAndAddProductsScreen(
              tableName: tableName,
              nameDepartment: nameDepartment,
            ),
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
      case Routes.productDetailsScreen:
        var arguments = settings.arguments as List;
        var product = arguments[0];
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.productDetailsScreen),
          builder: (context) => ProductDetailsScreen(product: product),
        );
      case Routes.answerIsYesScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.answerIsYesScreen),
          builder: (context) => const AnswerIsYesScreen(),
        );
      case Routes.readyToReceiveScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.readyToReceiveScreen),
          builder: (context) => const ReadyToReceiveScreen(),
        );
      case Routes.deliveryTimeScreen:
        initDeliveryTime();
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.deliveryTimeScreen),
          builder: (context) => BlocProvider(
            create: (context) => instance<DeliveryTimeBloc>(),
            child: const DeliveryTimeScreen(),
          ),
        );

      case Routes.waitForPickupScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.waitForPickupScreen),
          builder: (context) => const WaitForPickupScreen(),
        );

      case Routes.editProfileProvideServiceScreen:
        initEditProfileProvideService();
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.editProfileProvideServiceScreen),
          builder: (context) => BlocProvider<EditProfileProvideServiceBloc>(
            create: (context) => instance<EditProfileProvideServiceBloc>(),
            child: EditProfileProvideServiceScreen(),
          ),
        );
      case Routes.registerAsServiceProvideSuccessfullyScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
              name: Routes.registerAsServiceProvideSuccessfullyScreen),
          builder: (context) => RegisterAsServiceProvideSuccessfullyScreen(),
        );
      case Routes.detailServiceProvideScreen:
        UserModel user = settings.arguments as UserModel ;
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.detailServiceProvideScreen),
          builder: (context) => DetailsServiceProvideScreen(user:user),
        );
      case Routes.listServicesProvidesScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: Routes.listServicesProvidesScreen),
          builder: (context) => ListServicesProvidesScreen(),
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
