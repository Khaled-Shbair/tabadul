import '/config/all_imports.dart';

class Routes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> zoomDrawerNavigatorKey =
      GlobalKey<NavigatorState>();

  static const String splashScreen = 'splash_screen';
  static const String onBoardingScreen = 'on_boarding_screen';
  static const String loginScreen = 'login_screen';
  static const String createAccountScreen = 'create_account_screen';
  static const String securityCodeScreen = 'security_code_screen';
  static const String logoutScreen = 'logout_screen';
  static const String mainScreen = 'main_screen';
  static const String homeScreen = 'home_screen';
  static const String addPersonalInformationScreen =
      'add_personal_information_screen';

  /////////////
  static const String infoScreen = 'info_screen';
  static const String profileScreen = 'profile_screen';
  static const String provideService = 'provide_service';
  static const String addAndBuyScreen = 'add_and_buy_screen ';
  static const String addProductScreen = 'add_product_screen';
  static const String answerIsNoScreen = 'answer_is_no_screen';
  static const String answerIsYesScreen = 'answer_is_yes_screen';
  static const String detailProductScreen = 'detail_product_screen';
  static const String waitForPickupScreen = 'wait_for_pickup_screen';
  static const String notificationsScreen = 'notifications_screen';

  static const String readyToReceiveScreen = 'ready_to_receive_screen';
  static const String addedSuccessfullyScreen = 'added_successfully_screen';
  static const String computerDepartmentScreen = 'computer_department_screen';
  static const String listProvideServiceScreen = 'list_provide_service_screen';
  static const String serviceProviderAlterScreen =
      'service_provider_alter_screen';
  static const String departmentAddProductScreen =
      'department_add_product_screen';
  static const String detailServiceProvideScreen =
      'detail_Service_provide_screen';
  static const String profileProvideServiceScreen =
      'profile_provide_service_screen';
  static const String accountCreatedSuccessfullyScreen =
      'account_created_successfully_screen';
  static const String serviceProviderRegistrationScreen =
      'service_provider_registration_screen';
}
