import '/config/all_imports.dart';

class ManagerTextThemeLight extends TextTheme {
  @override

  /// [name] profile screen
  TextStyle get headlineLarge => ManagerTextStyles.font17PrimaryColorBold;

  @override
  TextStyle get headlineMedium => ManagerTextStyles.font16PrimaryColorBold;

  /// [title] created account successfully screen
  @override
  TextStyle get titleLarge => ManagerTextStyles.font17SpaceCadetBold;

  @override
  TextStyle get titleMedium => ManagerTextStyles.font20PrimaryColorBold;

  @override
  TextStyle get titleSmall => ManagerTextStyles.font15WhiteBold;

  // sub title on boarding screen
  @override
  TextStyle get headlineSmall => ManagerTextStyles.font15SpaceCadetBold;

  /// [phone number of country in auth screen]
  /// [personal data] profile screen
  @override
  TextStyle get displaySmall => ManagerTextStyles.font14PrimaryColorMedium;

  /// richText button in auth and create account
  @override
  TextStyle get displayMedium => ManagerTextStyles.font14SpaceCadetBold;

  @override
  TextStyle get bodyLarge =>  ManagerTextStyles.font12PrimaryColorBold;

  ///style name of department in [CustomDepartmentButton] widget
  @override
  TextStyle get bodyMedium => ManagerTextStyles.font11PrimaryColorBold;

  /// style of text error
  @override
  TextStyle get bodySmall => ManagerTextStyles.font12ErrorColorBold;

  @override
  TextStyle get labelLarge => ManagerTextStyles.font12WhiteBold;

  /// [logout button]
  @override
  TextStyle get labelMedium => ManagerTextStyles.font9WhiteBold;

  @override
  TextStyle get labelSmall => ManagerTextStyles.font9PrimaryColorBold;
}
