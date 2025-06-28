import '/config/all_imports.dart';

class AddProductRequest {
  final List<File> imageFilesList;
  final String productName;
  final String description;
  final double price;
  final String tableName;
  List<String>? images;

  AddProductRequest({
    required this.tableName,
    required this.description,
    required this.productName,
    required this.price,
    required this.imageFilesList,
  });

  Map<String, dynamic> toJson() {
    return {
      FirebaseConstants.name: productName,
      FirebaseConstants.price: price,
      FirebaseConstants.description: description,
      FirebaseConstants.images: images,
      FirebaseConstants.createdAt: FieldValue.serverTimestamp(),
    };
  }
}
