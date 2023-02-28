class City {
  late int id;
  late String nameAr;
  late String nameEn;

  City({required this.nameAr, required this.id});

  City.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nameAr = map['name_ar'];
    nameEn = map['name_en'];
  }
}
