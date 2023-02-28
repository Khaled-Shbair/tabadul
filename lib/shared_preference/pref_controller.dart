import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey {
  login,
  phone,
  id,
  onBoarding,
  verificationId,
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
  set verificationId(String value) =>
      _pref.setString(PrefKey.verificationId.toString(), value);

  String get verificationId =>
      _pref.getString(PrefKey.verificationId.toString()) ?? '';

  set onBoarding(bool value) =>
      _pref.setBool(PrefKey.onBoarding.toString(), value);

  bool get onBoarding => _pref.getBool(PrefKey.onBoarding.toString()) ?? false;

  set login(bool value) => _pref.setBool(PrefKey.login.toString(), value);

  bool get login => _pref.getBool(PrefKey.login.toString()) ?? false;
}
