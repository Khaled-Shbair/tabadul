part of 'security_code_bloc.dart';

sealed class SecurityCodeState {}

class SecurityCodeInitial extends SecurityCodeState {}

class VerifiedSecurityCodeSuccessfully extends SecurityCodeState {}

class VerifiedSecurityCodeFailed extends SecurityCodeState {
  final String message;

  VerifiedSecurityCodeFailed(this.message);
}

class VerifiedSecurityCodeLoading extends SecurityCodeState {}

