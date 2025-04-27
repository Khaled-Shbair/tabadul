import '/config/all_imports.dart';

ThemeData managerLightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
    ///Primary Color in application
    primaryColor: ManagerColors.primaryColor,

    ///Scaffold background Color in application
    scaffoldBackgroundColor: ManagerColors.white,

    /// any widget not need color (border, button ,etc...)
    unselectedWidgetColor: ManagerColors.transparent,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ManagerColors.primaryColor,
      onPrimary: ManagerColors.spaceCadet,
      secondary: ManagerColors.antiFlashWhite,
      onSecondary: ManagerColors.primaryColor,

      /// coolGrey color
      onTertiary: ManagerColors.coolGrey,

      error: ManagerColors.primaryColor,
      onError: ManagerColors.primaryColor,
      // any widget use white color (text, border, etc...)
      surface: Colors.white,
      onSurface: ManagerColors.primaryColor,
    ),

    /// Template [AppBar] to application
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
      surfaceTintColor: ManagerColors.white,
      backgroundColor: ManagerColors.transparent,
      elevation: AppConstants.elevationAppBarTheme,
      iconTheme: IconThemeData(
        color: ManagerColors.primaryColor,
        size: ManagerIconsSizes.i14,
      ),
      titleTextStyle: TextStyle(
        color: ManagerColors.primaryColor,
        fontFamily: ManagerFontFamily.kHelveticaL,
        fontWeight: ManagerFontWeight.bold,
        fontSize: ManagerFontsSizes.f17,
      ),
    ),

    /// Template [Text Filed] to application
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      errorMaxLines: 1,
      fillColor: ManagerColors.antiFlashWhite,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(ManagerRadius.r4),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ManagerColors.errorColor),
        borderRadius: BorderRadius.circular(ManagerRadius.r4),
      ),
      errorStyle: TextStyle(
        color: ManagerColors.errorColor,
        fontFamily: ManagerFontFamily.kHelveticaL,
        fontSize: ManagerFontsSizes.f11,
        fontWeight: FontWeight.w100,
        height: 3,
      ),
      hintStyle: TextStyle(
        fontSize: ManagerFontsSizes.f11,
        fontFamily: ManagerFontFamily.kHelveticaL,
        color: ManagerColors.primaryColor.withAlpha(80),
      ),
      contentPadding: EdgeInsetsDirectional.only(
        top: ManagerHeight.h17,
        bottom: ManagerHeight.h10,
        start: ManagerWidth.w22,
        end: ManagerWidth.w8,
      ),
    ),

    /// Template [Dropdown Menu] to application
    dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(),
        textStyle: TextStyle(),
        inputDecorationTheme: InputDecorationTheme()),

    textTheme: ManagerTextThemeLight(),
  );
}
