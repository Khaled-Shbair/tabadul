import '/config/all_imports.dart';

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? city;
  String? regionAndStreet;
  String? image;

  UserModel.formMap(Map<String, dynamic> map) {
    firstName = map[FirebaseConstants.firstName];
    lastName = map[FirebaseConstants.lastName];
    phoneNumber = map[FirebaseConstants.phoneNumber];
    id = map[FirebaseConstants.id];
    city = map[FirebaseConstants.city];
    regionAndStreet = map[FirebaseConstants.regionAndStreet];
    image = map[FirebaseConstants.image];
  }
}
