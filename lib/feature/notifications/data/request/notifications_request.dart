import '/config/all_imports.dart';

class NotificationsRequest {
  final String id;
  final DocumentSnapshot? lastDoc;
  NotificationsRequest(this.id, [this.lastDoc]);
}
