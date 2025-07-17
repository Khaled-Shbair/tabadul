import '/config/all_imports.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> login(AuthRequest request);

  Future<Either<Failure, AuthResponse>> createAccount(AuthRequest request);
  Future<Either<Failure, bool>> logout();

  Future<Either<Failure, SendSecurityCodeResponse>> sendSecurityCode(
      SendSecurityCodeRequest request);

  Future<Either<Failure, VerifySecurityCodeResponse>> verifySecurityCode(
      VerifySecurityCodeRequest request);
}

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(this._dataSource, this._networkInfo, this._sharedPref);
  final SharedPreferencesController _sharedPref;
  final RemoteAuthDataSource _dataSource;
  final NetworkInfo _networkInfo;
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

  @override
  Future<Either<Failure, SendSecurityCodeResponse>> sendSecurityCode(
      request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.sendSecurityCode(request);
        return Right(response);
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
  Future<Either<Failure, VerifySecurityCodeResponse>> verifySecurityCode(
      request) async {
    if (await _networkInfo.isConnected) {
      try {
        var response = await _dataSource.verifySecurityCode(request);

        if (response.status == true) {
          if (response.userData != null) {
            _sharedPref.setData(SharedPreferenceKeys.loggedIn, true);
            _sharedPref.setData(
                SharedPreferenceKeys.firstName, response.userData!.firstName);
            _sharedPref.setData(
                SharedPreferenceKeys.lastName, response.userData!.lastName);
            _sharedPref.setData(
                SharedPreferenceKeys.city, response.userData!.city);
            _sharedPref.setData(SharedPreferenceKeys.regionAndStreet,
                response.userData!.regionAndStreet);
            _sharedPref.setData(SharedPreferenceKeys.phoneNumber,
                response.userData!.phoneNumber);
            _sharedPref.setData(
                SharedPreferenceKeys.image, response.userData!.image);
            _sharedPref.setData(SharedPreferenceKeys.id, response.userData!.id);
            _sharedPref.setData(SharedPreferenceKeys.description,
                response.userData!.detailsOfServiceProvider ?? '');
            _sharedPref.setData(
                SharedPreferenceKeys.job, response.userData!.job ?? '');
            _sharedPref.setData(SharedPreferenceKeys.imageOfProvideService,
                response.userData!.imageOfProvideService ?? '');
          }
          return Right(response);
        } else {
          return Left(
            Failure(
              code: ResponseCode.INVALID_VERIFICATION_CODE.value,
              message: ManagerStrings.invalidVerificationCode,
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
