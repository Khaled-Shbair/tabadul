import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey {
  login,
  phone,
  id,
  onBoarding,
  verificationId,
  firstName,
  lastName,
  city,
  street,
  image,
}

class PrefController {
  static final PrefController _instance = PrefController._();
  late SharedPreferences _pref;

  PrefController._();

  factory PrefController() {
    return _instance;
  }

  Future<void> initializeApp() async =>
      _pref = await SharedPreferences.getInstance();

////////////////////////////////////////////////////////////////////////////////
//   set verificationId(String value) =>
//       _pref.setString(PrefKey.verificationId.toString(), value);

  // String get verificationId =>
  //     _pref.getString(PrefKey.verificationId.toString()) ?? '';

  set onBoarding(bool value) =>
      _pref.setBool(PrefKey.onBoarding.toString(), value);

  bool get onBoarding => _pref.getBool(PrefKey.onBoarding.toString()) ?? false;

  set login(bool value) => _pref.setBool(PrefKey.login.toString(), value);

  bool get login => _pref.getBool(PrefKey.login.toString()) ?? false;

////////////////////////////////////////////////////////////////////////////////
  set id(String value) => _pref.setString(PrefKey.id.toString(), value);

  String get id => _pref.getString(PrefKey.id.toString()) ?? '';

  set firstName(String value) =>
      _pref.setString(PrefKey.firstName.toString(), value);

  String get firstName => _pref.getString(PrefKey.firstName.toString()) ?? '';

  set lastName(String value) =>
      _pref.setString(PrefKey.lastName.toString(), value);

  String get lastName => _pref.getString(PrefKey.lastName.toString()) ?? '';

  set city(String value) => _pref.setString(PrefKey.city.toString(), value);

  String get city => _pref.getString(PrefKey.city.toString()) ?? '';

  set street(String value) => _pref.setString(PrefKey.street.toString(), value);

  String get street => _pref.getString(PrefKey.street.toString()) ?? '';

  set image(String value) => _pref.setString(PrefKey.image.toString(), value);

  String get image => _pref.getString(PrefKey.image.toString()) ?? '';

  set phone(String value) => _pref.setString(PrefKey.phone.toString(), value);

  String get phone => _pref.getString(PrefKey.phone.toString()) ?? '';
}
