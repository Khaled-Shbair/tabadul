import '/config/all_imports.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);
}

class LoginRepoImpl extends LoginRepo {
  final RemoteLoginDataSource _dataSource;
  final NetworkInfo _networkInfo;

  LoginRepoImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.login(request);
        return Right(response);
      } catch (e) {
        if (e is Exception &&
            e.toString() == 'Exception: ${ManagerStrings.userNotRegistered}') {
          return Left(
            Failure(
              code: ResponseCode.NOT_FOUND.value,
              message: ManagerStrings.userNotRegistered,
            ),
          );
        } else {
          return Left(ErrorHandler.handle(e.toString()).failure);
        }
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
