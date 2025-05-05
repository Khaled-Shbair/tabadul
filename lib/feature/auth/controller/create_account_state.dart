part of 'create_account_bloc.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitial extends CreateAccountState {}

class CreateAccountLoading extends CreateAccountState {}

class CreateAccountSuccessfully extends CreateAccountState {
  final String phoneNumber;

  CreateAccountSuccessfully(this.phoneNumber);
}

class CreateAccountFailure extends CreateAccountState {
  final String message;

  CreateAccountFailure(this.message);
}

class SelectedCodeOfCountry extends CreateAccountState {
  final String selectedValue;

  SelectedCodeOfCountry(this.selectedValue);
}
