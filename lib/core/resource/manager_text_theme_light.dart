import '/config/all_imports.dart';

class ManagerTextThemeLight extends TextTheme {
  @override

  /// [title] created account successfully screen
  TextStyle get titleLarge => ManagerTextStyles.font17SpaceCadetBold;

  @override
  TextStyle get titleMedium => ManagerTextStyles.font20PrimaryColorBold;

  @override
  TextStyle get titleSmall => ManagerTextStyles.font15WhiteBold;

  // sub title on boarding screen
  @override
  TextStyle get headlineSmall => ManagerTextStyles.font15SpaceCadetBold;

  @override
  TextStyle get labelLarge => ManagerTextStyles.font12WhiteBold;

  /// [phone number of country in auth screen]
  @override
  TextStyle get displaySmall => ManagerTextStyles.font14PrimaryColorMedium;

  /// richText button in auth and create account
  @override
  TextStyle get displayMedium => ManagerTextStyles.font14SpaceCadetBold;

  /// style of text error
  @override
  TextStyle get bodySmall => ManagerTextStyles.font12ErrorColorBold;

  /// [logout button]
  @override
  TextStyle get labelMedium => ManagerTextStyles.font9WhiteBold;

  @override
  TextStyle get labelSmall => ManagerTextStyles.font9PrimaryColorBold;
}
