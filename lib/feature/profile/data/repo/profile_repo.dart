import '/config/all_imports.dart';

abstract class ProfileRepo {
  Future<Either<Failure, EditProfileResponse>> editProfile(UserModel request);

  Future<Either<Failure, CitiesModel>> getCities();

  Future<Either<Failure, RegionsModel>> getRegions();
}

class ProfileRepoImpl extends ProfileRepo {
  final RemoteProfileDataSource _dataSource;
  final NetworkInfo _networkInfo;

  ProfileRepoImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, EditProfileResponse>> editProfile(request) async {
    if (await _networkInfo.isConnected) {
      try {
        String? pathImage;
        if (request.updateImage != null) {
          final compressed =
              await ImageCompressor.compressImage(request.updateImage!);
          if (compressed != null) {
            pathImage = await _dataSource.editImageProfile(
                compressed, request.phoneNumber!);
          }
        }

        if (pathImage != null) {
          request.image = pathImage;
          request.updateImage = null;
        }
        var response = await _dataSource.editProfile(request);
        if (response.status == true) {
          response.image = pathImage;
          return Right(response);
        }
        return Left(
          Failure(
            code: ResponseCode.BAD_REQUEST.value,
            message: ManagerStrings.badRequest,
          ),
        );
      } catch (e) {
        return Left(ErrorHandler.handle(e.toString()).failure);
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
  Future<Either<Failure, CitiesModel>> getCities() async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.getCities();
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e.toString()).failure);
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
  Future<Either<Failure, RegionsModel>> getRegions() async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.getRegions();
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e.toString()).failure);
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
