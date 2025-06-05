import '/config/all_imports.dart';

abstract class RemoteNotificationsDataSource {
  Future<NotificationsResponse> getNotifications(NotificationsRequest request);
}

class RemoteNotificationsDataSourceImpl extends RemoteNotificationsDataSource {
final FbFirestoreController _firestore;
  RemoteNotificationsDataSourceImpl(this._firestore);
  @override
Future<NotificationsResponse> getNotifications(request)async{
  return await _firestore.getNotifications(request.id,request.lastDoc);
}
  
}
