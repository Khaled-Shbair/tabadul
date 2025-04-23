part of 'login_bloc.dart';

sealed class LoginEvent {}

class LoginProcess extends LoginEvent {}

class SelectCodeCountry extends LoginEvent {
  final String? value;

  SelectCodeCountry(this.value);
}
