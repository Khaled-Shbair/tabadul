import '/config/all_imports.dart';

class SharedPreferencesController {
  // private constructor as I don’t allow creating an instance of this class itself
  SharedPreferencesController._();

  // create only one instance from this class
  static final SharedPreferencesController _sharedPreferencesController =
      SharedPreferencesController._();

  // create factory constructor to return instance of this class
  factory SharedPreferencesController() => _sharedPreferencesController;

  static late SharedPreferences _sharedPreferences;

  /// Initialize SharedPreferences
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // AppSettingsSharedPreferences._();
  ///Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    debugPrint('SharedPreferences : data with key : $key has been removed');
    await _sharedPreferences.remove(key);
  }

  ///Removes all keys and values in the SharedPreferences.
  static clearAllData() async {
    debugPrint('SharedPreferences : all data has been cleared');
    await _sharedPreferences.clear();
  }

  ///Save a [value] with a [key] in the SharedPreferences.
  static setData(String key, dynamic value) async {
    debugPrint('SharedPreferences : setData with key: $key and value : $value');
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    } else {
      debugPrint('Error: Unsupported type for SharedPreferences: $value');
      return null;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static bool getBool(String key) {
    debugPrint('SharedPreferences : getBool with key: $key');
    return _sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a int value from SharedPreferences with given [key].
  static int getInt(String key) {
    debugPrint('SharedPreferences : getInt with key: $key');
    return _sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static double getDouble(String key) {
    debugPrint('SharedPreferences : getDouble with key: $key');
    return _sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets a String value from SharedPreferences with given [key].
  static String getString(String key) {
    debugPrint('SharedPreferences : getString with key: $key');
    return _sharedPreferences.getString(key) ?? '';
  }
}
