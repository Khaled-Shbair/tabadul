import '/config/all_imports.dart';

class Failure {
  int code;
  String message;

  Failure({
    required this.code,
    required this.message,
  });
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is String) {
      failure = Failure(code: -1, message: error);
    } else {
      failure = Failure(
        code: ResponseCode.BAD_REQUEST.value,
        message: ManagerStrings.badRequest,
      );
    }
  }
}
