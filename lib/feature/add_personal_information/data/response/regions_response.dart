import '/config/all_imports.dart';

class RegionsResponse {
  final List<RegionResponse> regions;

  RegionsResponse({
    required this.regions,
  });
}

class RegionResponse {
  String? nameAr;
  String? nameEn;

  RegionResponse({
    required this.nameAr,
    required this.nameEn,
  });

  RegionResponse.fromMap(Map<String, dynamic> map) {
    nameAr = map[FirebaseConstants.nameAr];
    nameEn = map[FirebaseConstants.nameEn];
  }
}
