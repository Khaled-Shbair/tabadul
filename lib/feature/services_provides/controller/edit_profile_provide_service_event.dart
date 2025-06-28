part of 'edit_profile_provide_service_bloc.dart';

sealed class EditProfileProvideServiceEvent {}

class PickImageFromCamera extends EditProfileProvideServiceEvent {
  String imagePath;

  PickImageFromCamera(this.imagePath);
}

class PickImageFromGallery extends EditProfileProvideServiceEvent {
  String imagePath;

  PickImageFromGallery(this.imagePath);
}
class SaveEditedData extends EditProfileProvideServiceEvent {
}
