part of 'security_code_bloc.dart';

sealed class SecurityCodeEvent {}

class ResendSecurityCode extends SecurityCodeEvent {
  final String phoneNumber;

  ResendSecurityCode(this.phoneNumber);
}

class VerifySecurityCode extends SecurityCodeEvent {
  final String code;

  VerifySecurityCode(this.code);
}

class StartResendTimer extends SecurityCodeEvent {}

class TickResendTimer extends SecurityCodeEvent {}
