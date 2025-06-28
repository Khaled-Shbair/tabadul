part of 'register_as_service_provide_bloc.dart';

sealed class RegisterAsServiceProvideState {
  final String image;
  RegisterAsServiceProvideState(this.image);
}

class RegisterAsServiceProvideInitial extends RegisterAsServiceProvideState {
  RegisterAsServiceProvideInitial(super.image);
}

class RegisterAsServiceProvideLoading extends RegisterAsServiceProvideState {
  RegisterAsServiceProvideLoading(super.image);
}

class RegisterAsServiceProvideFailure extends RegisterAsServiceProvideState {
  final String message;
  RegisterAsServiceProvideFailure(this.message, super.image);
}

class RegisterAsServiceProvideSuccessfully
    extends RegisterAsServiceProvideState {
  RegisterAsServiceProvideSuccessfully(super.image);
}
