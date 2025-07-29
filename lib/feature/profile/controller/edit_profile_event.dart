part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent {}

class EditButton extends EditProfileEvent {

}

class SelectCity extends EditProfileEvent {
  final String city;

  SelectCity(this.city);
}

class SelectRegion extends EditProfileEvent {
  final String regionAndStreet;

  SelectRegion(this.regionAndStreet);
}

class GetCities extends EditProfileEvent {}

class GetRegions extends EditProfileEvent {}

class PickProfileImageFromCamera extends EditProfileEvent {
  String imagePath;

  PickProfileImageFromCamera(this.imagePath);
}

class PickProfileImageFromGallery extends EditProfileEvent {
  String imagePath;

  PickProfileImageFromGallery(this.imagePath);
}
