part of 'edit_profile_provide_service_bloc.dart';

sealed class EditProfileProvideServiceState {
  final String image;

  const EditProfileProvideServiceState({required this.image});
}

class EditProfileProvideServiceInitial extends EditProfileProvideServiceState {
  EditProfileProvideServiceInitial({required super.image});
}

class EditProfileProvideServiceLoading extends EditProfileProvideServiceState {
  EditProfileProvideServiceLoading({required super.image});
}

class EditProfileProvideServiceSuccessfully
    extends EditProfileProvideServiceState {
  EditProfileProvideServiceSuccessfully({required super.image});
}

class EditProfileProvideServiceFailure extends EditProfileProvideServiceState {
  final String messageError;

  EditProfileProvideServiceFailure(this.messageError, {required super.image});
}
