import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref preferences = SharedPref._internal();

  static late SharedPreferences sharedPreferences;

  factory SharedPref() {
    return preferences;
  }

  SharedPref._internal();

  ///Below method is to initialize the SharedPreference instance.
  initPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ///Below method is to return the SharedPreference instance.
  SharedPreferences getPreferenceInstance() {
    return sharedPreferences;
  }

  ///Below method is to set the string value in the SharedPreferences.
  Future setString({required String key, required String stringValue}) async {
    sharedPreferences.setString(key, stringValue);
  }

  ///Below method is to get the string value from the SharedPreferences.
  String? getString({required String key}) {
    return sharedPreferences.getString(key) ?? 'null';
  }

  ///Below method is to set the boolean value in the SharedPreferences.
  Future setBoolean({required String key, required bool booleanValue}) async {
    sharedPreferences.setBool(key, booleanValue);
  }

  ///Below method is to get the boolean value from the SharedPreferences.
  bool? getBoolean({required String key}) {
    return sharedPreferences.getBool(key) ?? false;
  }

  ///Below method is to set the double value in the SharedPreferences.
  Future setDouble({required String key, required double doubleValue}) async {
    sharedPreferences.setDouble(key, doubleValue);
  }

  ///Below method is to set the double value from the SharedPreferences.
  double? getDouble({required String key}) {
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  ///Below method is to set the int value in the SharedPreferences.
  Future setInt({required String key, required int intValue}) async {
    sharedPreferences.setInt(key, intValue);
  }

  ///Below method is to get the int value from the SharedPreferences.
  int? getInt({required String key}) {
    return sharedPreferences.getInt(key) ?? 0;
  }

  ///Below method is to remove the received preference.
  removePreference({required String key}) {
    sharedPreferences.remove(key);
  }

  ///Below method is to check the availability of the received preference .
  bool containPreference({required String key}) {
    if (sharedPreferences.get(key) == null) {
      return false;
    } else {
      return true;
    }
  }

  ///Below method is to clear the SharedPreference.
  clearPreferences() async {
    await sharedPreferences.clear();
  }
}
