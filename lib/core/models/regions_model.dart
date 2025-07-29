import '/config/all_imports.dart';

class RegionsModel {
  final List<RegionModel> regions;

  RegionsModel({
    required this.regions,
  });
}

class RegionModel {
  String? nameAr;
  String? nameEn;

  RegionModel({
    required this.nameAr,
    required this.nameEn,
  });

  RegionModel.fromMap(Map<String, dynamic> map) {
    nameAr = map[FirebaseConstants.nameAr];
    nameEn = map[FirebaseConstants.nameEn];
  }
}
