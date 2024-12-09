import '/config/all_imports.dart';

class ManagerTextStyles {
  static TextStyle _mainTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: ManagerFontFamily.kHelveticaL,
    );
  }

  static TextStyle font22BlackBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f22,
    fontWeight: ManagerFontWeight.bold,
    color: ManagerColors.black,
  );
}
