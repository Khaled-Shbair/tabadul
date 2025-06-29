import '/config/all_imports.dart';

extension NonNullBool on bool? {
  bool onNull() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension NonNullList on List? {
  List onNull() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}

extension NonNullString on String? {
  String onNull() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension Themes on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
}

extension Navigators on BuildContext {
  pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  pushNamedAndRemoveAllUntil(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  popAndPushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).popAndPushNamed(routeName, arguments: arguments);
  }

  pop() => Navigator.of(this).pop();
}
