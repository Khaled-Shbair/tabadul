import '/config/all_imports.dart';

class EditProfileRequest {
  String? firstName;
  String? lastName;
  File? uploadImage;
  String? image;
  String? region;
  String? city;
  String phoneNumber;

  EditProfileRequest({
    required this.phoneNumber,
    this.firstName,
    this.lastName,
    this.uploadImage,
    this.region,
    this.city,
  });

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};

    if (image != null) data[FirebaseConstants.image] = image;
    if (firstName != null) data[FirebaseConstants.firstName] = firstName;
    if (lastName != null) data[FirebaseConstants.lastName] = lastName;
    if (city != null) data[FirebaseConstants.city] = city;
    if (region != null) data[FirebaseConstants.regionAndStreet] = region;

    return data;
  }
}
