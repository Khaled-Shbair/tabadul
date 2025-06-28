part of 'logout_bloc.dart';

sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutSuccessfully extends LogoutState {}

final class LogoutFailure extends LogoutState {
  final String message;

  LogoutFailure(this.message);
}
