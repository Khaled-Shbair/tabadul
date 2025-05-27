part of 'edit_profile_bloc.dart';

sealed class EditProfileState {
  final String image;

  const EditProfileState({required this.image});
}

class EditProfileInitial extends EditProfileState {
  final List<String> cities;
  final List<String> regions;

  EditProfileInitial({
    this.cities = const [],
    this.regions = const [],
    super.image = '',
  });

  EditProfileInitial copyWith({
    List<String>? cities,
    List<String>? regions,
    String? image,
  }) {
    return EditProfileInitial(
      cities: cities ?? this.cities,
      regions: regions ?? this.regions,
      image: image ?? this.image,
    );
  }
}

class EditProfileLoading extends EditProfileState {
  EditProfileLoading({required super.image});
}

class EditProfileSuccessfully extends EditProfileState {
  EditProfileSuccessfully({required super.image});
}

class EditProfileFailure extends EditProfileState {
  final String messageError;

  EditProfileFailure(this.messageError, {required super.image});
}
