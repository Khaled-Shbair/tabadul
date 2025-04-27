part of 'security_code_bloc.dart';

sealed class SecurityCodeState {}

class SecurityCodeInitial extends SecurityCodeState {}

class VerifiedSecurityCodeSuccessfully extends SecurityCodeState {}

class VerifiedSecurityCodeFailed extends SecurityCodeState {
  final String message;

  VerifiedSecurityCodeFailed(this.message);
}

class VerifiedSecurityCodeLoading extends SecurityCodeState {}

class SecurityCodeTimerState extends SecurityCodeState {
  final int seconds;
  final bool canResend;

  SecurityCodeTimerState({
    required this.seconds,
    required this.canResend,
  });
}
