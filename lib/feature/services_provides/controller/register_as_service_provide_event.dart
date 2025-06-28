part of 'register_as_service_provide_bloc.dart';

sealed class RegisterAsServiceProvideEvent {}

class RegisterProcess extends RegisterAsServiceProvideEvent {
}

class PickProfileImageFromCamera extends RegisterAsServiceProvideEvent {
  String imagePath;

  PickProfileImageFromCamera(this.imagePath);
}

class PickProfileImageFromGallery extends RegisterAsServiceProvideEvent {
  String imagePath;

  PickProfileImageFromGallery(this.imagePath);
}
