part of 'create_account_bloc.dart';

@immutable
sealed class CreateAccountEvent {}

class CreateAccountProcess extends CreateAccountEvent {}

class SelectCodeOfCountry extends CreateAccountEvent {
  final String? value;

  SelectCodeOfCountry(this.value);
}
