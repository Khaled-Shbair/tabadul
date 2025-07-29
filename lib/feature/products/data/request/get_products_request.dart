import '/config/all_imports.dart';

class GetProductsRequest {
  GetProductsRequest(this.departmentName, this.lastDocument);
  final String departmentName;
  DocumentSnapshot? lastDocument;
}
