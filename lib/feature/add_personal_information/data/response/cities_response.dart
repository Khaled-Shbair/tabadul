import 'package:tabadul/config/all_imports.dart';

class CitiesResponse {
  final List<CityResponse> cities;

  CitiesResponse({
    required this.cities,
  });
}

class CityResponse {
  String? nameAr;
  String? nameEn;

  CityResponse({
    required this.nameAr,
    required this.nameEn,
  });

  CityResponse.fromMap(Map<String, dynamic> map) {
    nameAr = map[FirebaseConstants.nameAr];
    nameEn = map[FirebaseConstants.nameEn];
  }
}
