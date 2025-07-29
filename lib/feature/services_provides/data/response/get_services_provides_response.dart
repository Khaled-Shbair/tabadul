import '/config/all_imports.dart';

class GetServicesProvidesResponse {
  GetServicesProvidesResponse({
    required this.message,
    required this.status,
    required this.users,
    this.lastDocument,
  });
  final bool status;
  final String message;
  DocumentSnapshot? lastDocument;
  final List<UserModel> users;
} 