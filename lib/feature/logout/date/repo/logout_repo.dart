import '/config/all_imports.dart';

abstract class LogoutRepo {
  Future<Either<Failure, bool>> logout();
}

class LogoutRepoImpl extends LogoutRepo {
  final RemoteLogoutDataSource _dataSource;
  final NetworkInfo _networkInfo;

  LogoutRepoImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, bool>> logout() async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.logout();
        if (response) {
          return Right(response);
        } else {
          return Left(
            Failure(
              message: ManagerStrings.badRequest,
              code: ResponseCode.BAD_REQUEST.value,
            ),
          );
        }
      } catch (e) {
        return Left(
          Failure(
            message: ManagerStrings.badRequest,
            code: ResponseCode.BAD_REQUEST.value,
          ),
        );
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }
}
