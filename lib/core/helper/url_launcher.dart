import '/config/all_imports.dart';

/// - [PhoneNumber] {Ex:0599123456}
///
/// - [Message] appear in textFiled when open whatsapp application
void openWhatsAppChat(String phoneNumber, {String message = ''}) async {
  final Uri url = Uri.parse(
      'https://wa.me/97$phoneNumber?text=${Uri.encodeComponent(message)}');
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    debugPrint("Could not open WhatsApp.");
  }
}
