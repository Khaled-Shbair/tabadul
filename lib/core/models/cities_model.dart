import '/config/all_imports.dart';

class CitiesModel {
  final List<CityModel> cities;

  CitiesModel({
    required this.cities,
  });
}

class CityModel {
  String? nameAr;
  String? nameEn;

  CityModel({
    required this.nameAr,
    required this.nameEn,
  });

  CityModel.fromMap(Map<String, dynamic> map) {
    nameAr = map[FirebaseConstants.nameAr];
    nameEn = map[FirebaseConstants.nameEn];
  }
}
