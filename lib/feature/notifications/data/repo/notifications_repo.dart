import '/config/all_imports.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, NotificationsResponse>> getNotifications(
      NotificationsRequest request);
}

class NotificationsRepoImpl extends NotificationsRepo {
  NotificationsRepoImpl(this._dataSource, this._networkInfo);
  final RemoteNotificationsDataSource _dataSource;
  final NetworkInfo _networkInfo;
  @override
  Future<Either<Failure, NotificationsResponse>> getNotifications(
      NotificationsRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getNotifications(request);
        if (response.notifications.isNotEmpty) {
          return Right(response);
        } else {
          return Left(
            Failure(
              code: ResponseCode.NO_CONTENT.value,
              message: ManagerStrings.noNotifications,
            ),
          );
        }
      } catch (e) {
        return Left(
          Failure(
            code: ResponseCode.BAD_REQUEST.value,
            message: ManagerStrings.badRequest,
          ),
        );
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
