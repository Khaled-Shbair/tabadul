class VerifySecurityCodeRequest {
  final String securityCode;
  final String verificationId;

  VerifySecurityCodeRequest({
    required this.securityCode,
    required this.verificationId,
  });
}
