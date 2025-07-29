import '/config/all_imports.dart';

class VerifySecurityCodeResponse {
  final bool status;
  final UserModel? userData;

  VerifySecurityCodeResponse({
    this.userData,
    required this.status,
  });
}
