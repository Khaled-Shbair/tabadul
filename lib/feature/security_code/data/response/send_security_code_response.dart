class SendSecurityCodeResponse {
  final String verificationId;
  final String? message;
  final bool? status;

  SendSecurityCodeResponse({
    required this.verificationId,
    this.message,
    this.status,
  });
}
