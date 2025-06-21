import '/config/all_imports.dart';

class ProductResponse {
  String? id;
  List<String>? images;
  String? name;
  String? price;
  String? description;

  ProductResponse.fromMap(Map<String, dynamic> map) {
    images = map[FirebaseConstants.images];
    name = map[FirebaseConstants.productName];
    id = map[FirebaseConstants.id];
    price = map[FirebaseConstants.price];
    description = map[FirebaseConstants.description];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map[FirebaseConstants.images] = images;
    map['name'] = name;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}
