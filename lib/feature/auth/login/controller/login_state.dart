part of 'login_bloc.dart';

sealed class LoginState {}

class LoginInitial extends LoginState {}

class SelectedCodeCountry extends LoginState {
  final String selectedValue;

  SelectedCodeCountry(this.selectedValue);
}

class LoginLoading extends LoginState {}

class LoginSuccessfully extends LoginState {
  final String phoneNumber;

  LoginSuccessfully(this.phoneNumber);
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}
