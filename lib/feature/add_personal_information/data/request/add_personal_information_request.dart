import '../../../../config/all_imports.dart';

class AddPersonalInformationRequest {
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String regionAndStreet;
  final String city;
  final String? image;

  AddPersonalInformationRequest({
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.regionAndStreet,
    required this.city,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      FirebaseConstants.firstName: firstName,
      FirebaseConstants.lastName: lastName,
      FirebaseConstants.phoneNumber: phoneNumber,
      FirebaseConstants.image: image ??
          'https://firebasestorage.googleapis.com/v0/b/tabadul-34a2c.appspot.com/o/user.png?alt=media&token=bbae8920-b1ee-47be-b8d7-2af1e7187cee',
      FirebaseConstants.city: city,
      FirebaseConstants.regionAndStreet: regionAndStreet
    };
  }
}
