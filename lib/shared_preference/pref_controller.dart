import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey { login, phone, id, onBoarding }

class SharedPreferencesController {
  static final SharedPreferencesController _instance =
      SharedPreferencesController._();
  late SharedPreferences _sharedPreferences;

  SharedPreferencesController._();

  factory SharedPreferencesController() {
    return _instance;
  }

  Future<void> getInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save() async {
    // await _sharedPreferences.setString(PrefKey.phone.toString(), user.phone);
    // await _sharedPreferences.setInt(PrefKey.id.toString(), user.id);
    // await _sharedPreferences.setBool(PrefKey.login.toString(), true);
  }

  Future<void> saveOnBoarding({required bool value}) async {
    await _sharedPreferences.setBool(PrefKey.onBoarding.toString(), value);
  }

  bool get onBoarding =>
      _sharedPreferences.getBool(PrefKey.onBoarding.toString()) ?? false;

  bool get login =>
      _sharedPreferences.getBool(PrefKey.login.toString()) ?? false;

  T? getKey<T>({required String key}) {
    return _sharedPreferences.get(key) as T;
  }
}
