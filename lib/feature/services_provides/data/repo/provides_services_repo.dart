import '/config/all_imports.dart';

abstract class ServicesProvidesRepo {
  Future<Either<Failure, RegisterAsServiceProvideResponse>>
      registerAsServiceProvide(UserModel request);
  Future<Either<Failure, EditProfileResponse>> editProfileProvideService(
      UserModel request);
  Future<Either<Failure, GetServicesProvidesResponse>> getServiceProviders(
      GetServicesProvidesRequest request);
}

class ServicesProvidesRepoImpl extends ServicesProvidesRepo {
  ServicesProvidesRepoImpl(this._networkInfo, this._dataSource);
  final NetworkInfo _networkInfo;
  final RemoteProvidesServicesDataSource _dataSource;
  @override
  Future<Either<Failure, RegisterAsServiceProvideResponse>>
      registerAsServiceProvide(request) async {
    if (await _networkInfo.isConnected) {
      try {
        String? pathImage;
        if (request.updateImage != null) {
          final compressed =
              await ImageCompressor.compressImage(request.updateImage!);
          if (compressed != null) {
            pathImage = await _dataSource.addImageServiceProvide(
                compressed, request.phoneNumber!);
          }
        }
        if (pathImage != null) {
          request.imageOfProvideService = pathImage;
          request.updateImage = null;
        }

        var response = await _dataSource.registerAsServiceProvide(request);
        if (response.status) {
          if (pathImage != null) {
            response.image = pathImage;
          }
          return Right(response);
        } else {
          return Left(
            Failure(
              code: -99,
              message: response.message,
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
  Future<Either<Failure, EditProfileResponse>> editProfileProvideService(
      request) async {
    if (await _networkInfo.isConnected) {
      try {
        String? pathImage;
        if (request.updateImage != null) {
          final compressed =
              await ImageCompressor.compressImage(request.updateImage!);
          if (compressed != null) {
            pathImage = await _dataSource.addImageServiceProvide(
                compressed, request.phoneNumber!);
          }
        }
        if (pathImage != null) {
          request.imageOfProvideService = pathImage;
          request.updateImage = null;
        }

        var response = await _dataSource.editProfileProvideService(request);
        if (response.status) {
          if (pathImage != null) {
            response.image = pathImage;
          }
          return Right(response);
        } else {
          return Left(
            Failure(
              code: -99,
              message: response.error ?? '',
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
      );    }
  }

  @override
  Future<Either<Failure, GetServicesProvidesResponse>> getServiceProviders(
      GetServicesProvidesRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.getServiceProviders(request);
        if (response.status) {
          return Right(response);
        } else {
          return Left(
            Failure(
              code: -99,
              message: response.message,
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
      );     }
  }
}
