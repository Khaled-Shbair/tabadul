import '/config/all_imports.dart';

mixin Helper {
  void showSnackBar(String message, {bool error = false}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: ManagerFontsSizes.f12,
      textColor: error ? ManagerColors.errorColor : ManagerColors.successColor,
      gravity: ToastGravity.CENTER_RIGHT,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.transparent,
      timeInSecForIosWeb: 5,
    );
  }
}
