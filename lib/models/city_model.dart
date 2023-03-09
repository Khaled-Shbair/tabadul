class CityModel {
  late int id;
  late String nameAr;
  late String nameEn;

  CityModel({required this.nameAr, required this.id});

  CityModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nameAr = map['name_ar'];
    nameEn = map['name_en'];
  }
}
