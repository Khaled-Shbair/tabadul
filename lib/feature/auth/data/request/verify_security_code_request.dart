class VerifySecurityCodeRequest {
  final String securityCode;
  final String verificationId;
  final String phoneNumber;

  VerifySecurityCodeRequest({
    required this.securityCode,
    required this.verificationId,
    required this.phoneNumber,
  });
}
