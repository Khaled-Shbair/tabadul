part of 'add_personal_information_bloc.dart';

sealed class AddPersonalInformationEvent {}

class AddPersonalInformationProcess extends AddPersonalInformationEvent {
  final String phoneNumber;

  AddPersonalInformationProcess(this.phoneNumber);
}

class SelectCity extends AddPersonalInformationEvent {
  final String city;

  SelectCity(this.city);
}

class SelectRegionAndStreet extends AddPersonalInformationEvent {
  final String regionAndStreet;

  SelectRegionAndStreet(this.regionAndStreet);
}

class GetCities extends AddPersonalInformationEvent {}

class GetRegions extends AddPersonalInformationEvent {}
