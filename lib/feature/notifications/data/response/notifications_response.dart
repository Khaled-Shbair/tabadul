import '/config/all_imports.dart';

class NotificationsResponse {
  final List<NotificationResponse> notifications;
  final DocumentSnapshot? lastDoc;

  NotificationsResponse(this.notifications, [this.lastDoc]);
}

class NotificationResponse {
  String? content;
  DateTime? createdAt;
  String? id;
  String? title;

  Map<String, dynamic> toMap() {
    return {
      FirebaseConstants.id: id,
      FirebaseConstants.title: title,
      FirebaseConstants.content: content,
      FirebaseConstants.createdAt: FieldValue.serverTimestamp(),
    };
  }

  NotificationResponse.fromMap(Map<String, dynamic> map, String docId) {
    content = map[FirebaseConstants.content];
    createdAt = (map['createdAt'] as Timestamp?)?.toDate();
    title = map[FirebaseConstants.title];
    id = docId;
  }
}
