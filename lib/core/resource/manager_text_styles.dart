import '/config/all_imports.dart';

class ManagerTextStyles {
  static TextStyle _mainTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    String? fontFamily,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      fontFamily: fontFamily ?? ManagerFontFamily.kHelveticaL,
    );
  }

  static TextStyle font22BlackBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f22,
    fontWeight: ManagerFontWeight.bold,
    color: ManagerColors.black,
  );

  static TextStyle font15WhiteBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f15,
    fontWeight: ManagerFontWeight.bold,
    color: ManagerColors.white,
  );
  static TextStyle font9PrimaryColorBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f9,
    fontWeight: ManagerFontWeight.bold,
    color: ManagerColors.primaryColor,
  );

  static TextStyle font9WhiteBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f9,
    fontWeight: ManagerFontWeight.bold,
    color: ManagerColors.white,
    fontFamily: ManagerFontFamily.kHelveticaLNeeL,
  );

  static TextStyle font12WhiteBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f12,
    fontWeight: ManagerFontWeight.bold,
    color: ManagerColors.white,
  );

  static TextStyle font14SpaceCadetBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f13,
    color: ManagerColors.spaceCadet,
    fontWeight: ManagerFontWeight.regular,
    height: 1.6,
  );

  static TextStyle font14PrimaryColorMedium = _mainTextStyle(
    fontSize: ManagerFontsSizes.f14,
    color: ManagerColors.primaryColor,
    fontWeight: ManagerFontWeight.medium,
  );

  static TextStyle font17SpaceCadetBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f17,
    color: ManagerColors.spaceCadet,
    fontWeight: ManagerFontWeight.bold,
  );

  static TextStyle font12ErrorColorBold = TextStyle(
    fontSize: ManagerFontsSizes.f12,
    color: ManagerColors.errorColor,
    fontWeight: ManagerFontWeight.bold,
  );

  static TextStyle font20PrimaryColorBold = TextStyle(
    fontSize: ManagerFontsSizes.f20,
    color: ManagerColors.primaryColor,
    fontWeight: ManagerFontWeight.bold,
  );
  static TextStyle font15SpaceCadetBold = _mainTextStyle(
    fontSize: ManagerFontsSizes.f15,
    color: ManagerColors.spaceCadet,
    fontWeight: ManagerFontWeight.bold,
    fontFamily: ManagerFontFamily.kHelveticaLNeeL,
    height: 1.5,
  );
}
