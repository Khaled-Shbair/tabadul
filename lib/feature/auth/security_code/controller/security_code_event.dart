part of 'security_code_bloc.dart';

sealed class SecurityCodeEvent {}

class ResendSecurityCode extends SecurityCodeEvent {
  final String phoneNumber;

  ResendSecurityCode(this.phoneNumber);
}

class VerifySecurityCode extends SecurityCodeEvent {
  final String code;
  final String phoneNumber;

  VerifySecurityCode(this.code, this.phoneNumber);
}
