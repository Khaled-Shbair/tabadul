import '/config/all_imports.dart';

abstract class AddPersonalInformationRepo {
  Future<Either<Failure, AddPersonalInformationResponse>>
      addPersonalInformation(AddPersonalInformationRequest request);

  Future<Either<Failure, CitiesResponse>> getCities();

  Future<Either<Failure, RegionsResponse>> getRegions();
}

class AddPersonalInformationRepoImpl extends AddPersonalInformationRepo {
  final RemoteAddPersonalInformationDataSource _dataSource;
  final NetworkInfo _networkInfo;

  AddPersonalInformationRepoImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, AddPersonalInformationResponse>>
      addPersonalInformation(request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.addPersonalInformation(request);
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
  Future<Either<Failure, CitiesResponse>> getCities() async {
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
  Future<Either<Failure, RegionsResponse>> getRegions() async {
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
