part of 'add_personal_information_bloc.dart';

@immutable
sealed class AddPersonalInformationState {}

final class AddPersonalInformationInitial extends AddPersonalInformationState {
  final List<String> cities;
  final List<String> regions;
  final bool isLoading;

  AddPersonalInformationInitial({
    this.cities = const [],
    this.regions = const [],
    this.isLoading = false,
  });

  AddPersonalInformationInitial copyWith({
    List<String>? cities,
    List<String>? regions,
    bool? isLoading,
  }) {
    return AddPersonalInformationInitial(
      cities: cities ?? this.cities,
      regions: regions ?? this.regions,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class AddPersonalInformationLoading extends AddPersonalInformationState {}

final class AddPersonalInformationSuccessfully
    extends AddPersonalInformationState {}

final class AddPersonalInformationFailure extends AddPersonalInformationState {
  final String messageError;

  AddPersonalInformationFailure(this.messageError);
}
