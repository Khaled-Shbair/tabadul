import '/config/all_imports.dart';

abstract class ProductsRepo {
  Future<Either<Failure, ProductsResponse>> getProducts(
      GetProductsRequest request);

  Future<Either<Failure, AddProductResponse>> addProduct(
      AddProductRequest request);
  Future<List<String>> uploadProductImages(
      List<File> request, String tableName);
}

class ProductsRepoImpl extends ProductsRepo {
  ProductsRepoImpl(this._dataSource, this._networkInfo);
  final RemoteProductsDataSource _dataSource;
  final NetworkInfo _networkInfo;
  @override
  Future<Either<Failure, ProductsResponse>> getProducts(
      GetProductsRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.getProducts(request);
        if (response.products.isNotEmpty) {
          return Right(response);
        } else {
          return Left(
            Failure(
              code: ResponseCode.NO_CONTENT.value,
              message: ManagerStrings.noData,
            ),
          );
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
          message: ManagerStrings.noInternetConnection,
        ),
      );
    }
  }

  @override
  Future<List<String>> uploadProductImages(
      List<File> request, String tableName) async {
    try {
      List<File> imageCompressed = [];
      for (var e in request) {
        final compressed = await ImageCompressor.compressImage(e);
        if (compressed != null) {
          imageCompressed.add(compressed);
        }
      }

      var response =
          await _dataSource.uploadProductImages(imageCompressed, tableName);
      if (response.isNotEmpty) {
        return response;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Either<Failure, AddProductResponse>> addProduct(
      AddProductRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        List<String> urlProductImages = await uploadProductImages(
            request.imageFilesList, request.tableName);
        if (urlProductImages.isNotEmpty) {
          request.images = urlProductImages;
          var response = await _dataSource.addProduct(request);
          if (response.status) {
            return Right(response);
          } else {
            return Left(
              Failure(
                code: ResponseCode.NO_CONTENT.value,
                message: response.message,
              ),
            );
          }
        } else {
          return Left(
            Failure(
              code: ResponseCode.BAD_REQUEST.value,
              message: ManagerStrings.badRequest,
            ),
          );
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
          message: ManagerStrings.noInternetConnection,
        ),
      );
    }
  }
}
