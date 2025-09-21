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
      shadow: ManagerColors.primaryColor.withAlpha(80),

      /// color of box in [Profile] screen
      primaryContainer: ManagerColors.ghostWhite,

      /// coolGrey color
      onTertiary: ManagerColors.coolGrey,

      error: ManagerColors.primaryColor,
      onError: ManagerColors.primaryColor,
      // any widget use white color (text, border, etc...)
      surface: ManagerColors.white,
      onSurface: ManagerColors.primaryColor,

      ///use in decoration [Logout] screen
      surfaceContainerLow: ManagerColors.lavenderSoft,
      surfaceContainerLowest: ManagerColors.lavenderBrightS6,
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
      textStyle: TextStyle(
        fontSize: ManagerFontsSizes.f11,
        fontFamily: ManagerFontFamily.kHelveticaL,
        color: ManagerColors.primaryColor,
      ),
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
        contentPadding: EdgeInsetsDirectional.only(
          top: ManagerHeight.h17,
          bottom: ManagerHeight.h10,
          start: ManagerWidth.w22,
          end: ManagerWidth.w8,
        ),
        suffixIconColor: ManagerColors.primaryColor,
        hintStyle: TextStyle(
          fontSize: ManagerFontsSizes.f11,
          fontFamily: ManagerFontFamily.kHelveticaL,
          color: ManagerColors.primaryColor.withAlpha(80),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ManagerColors.primaryColor,
      elevation: 0,
      iconSize: ManagerIconsSizes.i30,
      shape: CircleBorder(),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ManagerColors.errorColor,
      actionBackgroundColor: ManagerColors.successColor,
      contentTextStyle: ManagerTextStyles.font9WhiteBold,
      actionTextColor: ManagerColors.white,
    ),
    textTheme: ManagerTextThemeLight(),
    tabBarTheme: TabBarThemeData(
      dividerColor: ManagerColors.transparent,
      unselectedLabelColor: ManagerColors.primaryColor,
      labelStyle: ManagerTextStyles.font15AntiFlashWhiteBold,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: ManagerColors.primaryColor,
        borderRadius: BorderRadius.circular(ManagerRadius.r22),
      ),
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: ManagerTextStyles.font12PrimaryColorBold,
      subtitleTextStyle: ManagerTextStyles.font12PrimaryColorRegular,
    ),
  );
}
