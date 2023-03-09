import 'package:tabadul/Screen/Add_And_Buy_Screen.dart';

import 'AllPages.dart';
import 'constants/routes.dart';
import 'Screen/menu_screen.dart';
import 'Screen/Main_Screen.dart';
import 'Screen/info_screen.dart';
import 'package:flutter/material.dart';
import 'Screen/Add_Product_Screen.dart';
import 'Screen/Answer_Is_No_Screen.dart';
import 'Screen/notifications_screen.dart';
import 'Screen/Answer_Is_Yes_Screen.dart';
import 'Screen/detail_product_screen.dart';
import 'Screen/Wait_for_pickup_Screen.dart';
import 'Screen/ready_to_receive_screen.dart';
import 'Screen/Added_Successfully_Screen.dart';
import 'Screen/Splash_Screen/Splash_Screen.dart';
import 'Screen/Department_Add_Product_Screen.dart';
import 'Screen/Splash_Screen/on_boarding_one_screen.dart';
import 'Screen/Splash_Screen/on_boarding_two_screen.dart';
import 'Screen/Provide_Service_Screen/Provide_Service.dart';
import 'Screen/Login and Create Account Screen/Login_Screen.dart';
import 'Screen/Login and Create Account Screen/Logout_Screen.dart';
import 'Screen/Provide_Service_Screen/List_Provide_Service_Screen.dart';
import 'Screen/Provide_Service_Screen/Service_Provide_Alter_Screen.dart';
import 'Screen/Login and Create Account Screen/Security_Code_Screen.dart';
import 'Screen/Login and Create Account Screen/Create_Account_Screen.dart';
import 'Screen/Provide_Service_Screen/Details_Service_Provide_Screen.dart';
import 'Screen/Provide_Service_Screen/Profile_Provide_Service_Screen.dart';
import 'Screen/Login and Create Account Screen/Add_Information_Screen.dart';
import 'Screen/Provide_Service_Screen/profile_screen.dart';
import 'Screen/Login and Create Account Screen/Account_Created_Successfully_Screen.dart';

class AppRoutes {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case securityCodeScreen:
        final navigator = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => SecurityCodeScreen(navigator: navigator));
      case onBoardingTwoScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoarding2Screen());
      case onBoardingOneScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingOneScreen());
      case accountCreatedSuccessfullyScreen:
        return MaterialPageRoute(
            builder: (context) => const AccountCreatedSuccessfullyScreen());
      case createAccountScreen:
        return MaterialPageRoute(
            builder: (context) => const CreateAccountScreen());
      case addInformationScreen:
        return MaterialPageRoute(
            builder: (context) => const AddInformationScreen());
      case addProductScreen:
        final department = settings.arguments as String;

        return MaterialPageRoute(
            builder: (context) => AddProductScreen(department));
      case detailProductScreen:
        return MaterialPageRoute(
            builder: (context) => const DetailProductScreen());
      // case departmentAddProductScreen:
      //   final value = settings.arguments as String;
      //   return MaterialPageRoute(
      //       builder: (context) => DepartmentAddProductScreen(value));

      case waitForPickupScreen:
        return MaterialPageRoute(
            builder: (context) => const WaitForPickupScreen());
      case answerIsYesScreen:
        return MaterialPageRoute(
            builder: (context) => const AnswerIsYesScreen());
      case answerIsNoScreen:
        return MaterialPageRoute(
            builder: (context) => const AnswerIsNoScreen());
      case readyToReceiveScreen:
        return MaterialPageRoute(
            builder: (context) => const ReadyToReceiveScreen());
      case addedSuccessfullyScreen:
        return MaterialPageRoute(
            builder: (context) => const AddedSuccessfullyScreen());
      case serviceProviderRegistrationScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case provideService:
        return MaterialPageRoute(
            builder: (context) =>
                const SuccessfullyRegisteredAsServiceProviderScreen());
      case listProvideServiceScreen:
        return MaterialPageRoute(
            builder: (context) => const ListProvideServiceScreen());
      case serviceProviderAlterScreen:
        return MaterialPageRoute(
            builder: (context) => const ServiceProviderAlterScreen());
      case profileProvideServiceScreen:
        return MaterialPageRoute(
            builder: (context) => const ProfileProvideServiceScreen());
      case detailServiceProvideScreen:
        return MaterialPageRoute(
            builder: (context) => const DetailServiceProvideScreen());
      case notificationsScreen:
        return MaterialPageRoute(
            builder: (context) => const NotificationsScreen());
      case profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case logoutScreen:
        return MaterialPageRoute(builder: (context) => const LogoutScreen());
      case infoScreen:
        return MaterialPageRoute(builder: (context) => const InfoScreen());
      case allPages:
        return MaterialPageRoute(builder: (context) => const AllPages());
      case mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case menuScreen:
        return MaterialPageRoute(builder: (context) => const MenuScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      default:

        return MaterialPageRoute(
            builder: (context) => MenuScreen());
      //return MaterialPageRoute(builder: (context) => const SplashScreen());
      //TODO:Edit in add information screen
    }
  }
}
