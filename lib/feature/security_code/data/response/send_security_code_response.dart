class SendSecurityCodeResponse {
  final String verificationId;
  final int? resendToken;
  final String? message;
  final bool? status;

  SendSecurityCodeResponse({
    required this.verificationId,
    this.message,
    this.resendToken,
    this.status,
  });
}
