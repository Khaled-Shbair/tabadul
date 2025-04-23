import '/config/all_imports.dart';

class LoginResponse {
  String? firstName;
  String? lastName;
  String? city;
  String? region;
  String? image;

  LoginResponse.fromMap(Map<String, dynamic> map) {
    firstName = map[FirebaseConstants.firstName];
    lastName = map[FirebaseConstants.lastName];
    city = map[FirebaseConstants.city];
    region = map[FirebaseConstants.region];
    image = map[FirebaseConstants.image];
  }
}
