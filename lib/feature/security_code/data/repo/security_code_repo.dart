import '/config/all_imports.dart';

abstract class SecurityCodeRepo {
  Future<Either<Failure, SendSecurityCodeResponse>> sendSecurityCode(
      SendSecurityCodeRequest request);

  Future<Either<Failure, VerifySecurityCodeResponse>> verifySecurityCode(
      VerifySecurityCodeRequest request);
}

class SecurityCodeRepoImpl extends SecurityCodeRepo {
  final RemoteSecurityCodeDataSource _dataSource;
  final NetworkInfo _networkInfo;
  final SharedPreferencesController _sharedPref;

  SecurityCodeRepoImpl(this._dataSource, this._networkInfo, this._sharedPref);

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
}
