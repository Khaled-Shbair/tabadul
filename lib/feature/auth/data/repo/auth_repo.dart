import '/config/all_imports.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> login(AuthRequest request);

  Future<Either<Failure, AuthResponse>> createAccount(AuthRequest request);
}

class AuthRepoImpl extends AuthRepo {
  final RemoteAuthDataSource _dataSource;
  final NetworkInfo _networkInfo;

  AuthRepoImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, AuthResponse>> login(AuthRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.login(request);
        if (response.isExists) {
          return Right(response);
        } else {
          return Left(
            Failure(
              code: ResponseCode.NOT_FOUND.value,
              message: ManagerStrings.theNumberIsNotRegistered,
            ),
          );
        }
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
  Future<Either<Failure, AuthResponse>> createAccount(
      AuthRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.createAccount(request);
        if (!response.isExists) {
          return Right(response);
        } else {
          return Left(
            Failure(
              code: ResponseCode.USER_IS_REGISTER.value,
              message: ManagerStrings.theNumberIsAlreadyRegistered,
            ),
          );
        }
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
