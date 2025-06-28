import '/config/all_imports.dart';

class UserModel {
  String? id;

  String? firstName;
  String? lastName;

  String? city;
  String? regionAndStreet;
  String? image;
  String? imageOfProvideService;

  String? description;
  String? job;
  File? updateImage;
  String? phoneNumber;

  UserModel({
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.image,
    this.regionAndStreet,
    this.description,
    this.job,
    this.city,
    this.updateImage,
  });
  UserModel.formMap(Map<String, dynamic> map) {
    firstName = map[FirebaseConstants.firstName];
    lastName = map[FirebaseConstants.lastName];
    phoneNumber = map[FirebaseConstants.phoneNumber];
    id = map[FirebaseConstants.id];
    city = map[FirebaseConstants.city];
    regionAndStreet = map[FirebaseConstants.regionAndStreet];
    image = map[FirebaseConstants.image];
    description = map[FirebaseConstants.description];
    job = map[FirebaseConstants.job];
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    if (image != null) data[FirebaseConstants.image] = image;
    if (firstName != null) data[FirebaseConstants.firstName] = firstName;
    if (lastName != null) data[FirebaseConstants.lastName] = lastName;
    if (city != null) data[FirebaseConstants.city] = city;

    if (imageOfProvideService != null) {
      data[FirebaseConstants.imageOfProvideService] = imageOfProvideService;
    }
    if (description != null) data[FirebaseConstants.description] = description;
    if (job != null) data[FirebaseConstants.job] = job;
    if (regionAndStreet != null) {
      data[FirebaseConstants.regionAndStreet] = regionAndStreet;
    }
    return data;
  }
}
