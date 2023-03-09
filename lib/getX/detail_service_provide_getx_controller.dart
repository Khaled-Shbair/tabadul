import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailServiceProvideGetxController extends GetxController {
  static DetailServiceProvideGetxController get to => Get.find();

  void callServiceProvide(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrlString(launchUri.toString())) {
      await launchUrlString(launchUri.toString());
    }
  }
}
