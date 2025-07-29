import '/config/all_imports.dart';

class ProductsResponse {
  ProductsResponse({
    required this.message,
    required this.status,
    required this.products,
    this.lastDocument,
  });
  final bool status;
  final String message;
  DocumentSnapshot? lastDocument;
  final List<ProductResponse> products;
}
