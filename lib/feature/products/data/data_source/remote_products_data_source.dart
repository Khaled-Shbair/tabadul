import '/config/all_imports.dart';

abstract class RemoteProductsDataSource {
  Future<ProductsResponse> getProducts(GetProductsRequest request);
  Future<AddProductResponse> addProduct(AddProductRequest request);
  Future<BuyProductResponse> buyProduct(BuyProductRequest request);

  Future<List<String>> uploadProductImages(
      List<File> request, String tableName);
}

class RemoteProductsDataSourceImpl extends RemoteProductsDataSource {
  RemoteProductsDataSourceImpl(this._firestore, this._storage);
  final FbFirestoreController _firestore;
  final FirebaseStorageController _storage;
  @override
  Future<ProductsResponse> getProducts(GetProductsRequest request) {
    return _firestore.getProducts(request.departmentName, request.lastDocument);
  }

  @override
  Future<BuyProductResponse> buyProduct(BuyProductRequest request) {
    return _firestore.buyProduct(request);
  }

  @override
  Future<AddProductResponse> addProduct(AddProductRequest request) {
    return _firestore.addProduct(request);
  }

  @override
  Future<List<String>> uploadProductImages(
      List<File> request, String tableName) {
    return _storage.uploadMultipleImagesToFirebase(request, tableName);
  }
}
