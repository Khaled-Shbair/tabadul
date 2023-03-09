import '../getX/add_information_getx_controller.dart';
import '../getX/create_account_getx_controller.dart';
import '../getX/security_code_getx_controller.dart';
import '../getX/add_product_getx_controller.dart';
import '../getX/profile_getx_controller.dart';
import '../getX/login_getx_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountGetxController());
    Get.lazyPut(() => LoginGetxController());
    Get.lazyPut(() => SecurityCodeGetxController());
    Get.lazyPut(() => AddInformationGetxController());
    Get.lazyPut(() => AddProductGetxController());
    Get.put(() => ProfileGetxController());
  }
}
