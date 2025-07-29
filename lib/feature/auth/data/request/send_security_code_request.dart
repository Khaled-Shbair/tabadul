class SendSecurityCodeRequest {
  final String phoneNumber;
  final int? resendToken;

  SendSecurityCodeRequest({
    required this.phoneNumber,
    this.resendToken,
  });
}
