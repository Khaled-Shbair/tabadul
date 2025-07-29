import '/config/all_imports.dart';

class ProductResponse {
  String? id;
  List<String>? images;
  String? name;
  int? price;
  String? description;

  ProductResponse.fromMap(Map<String, dynamic> map) {
    name = map[FirebaseConstants.name] as String?;
    id = map[FirebaseConstants.id] as String?;
    description = map[FirebaseConstants.description] as String?;
    images = List<String>.from(map[FirebaseConstants.images] ?? []);
    price = (map[FirebaseConstants.price] as num?)?.toInt();
  }
}
