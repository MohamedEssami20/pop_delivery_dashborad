import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceSigelton {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static void setBoolean(String key, bool value) async {
    await _instance.setBool(key, value);
  }

  static bool? getBoolean({required String key}) {
    return _instance.getBool(key) ?? false;
  }

  static Future<void> setString(String key, String value) async {
    await _instance.setString(key, value);
  }

  static String? getString({required String key}) {
    return _instance.getString(key);
  }

  static Future<void> setStringList(String key, List<String> value) async {
    await _instance.setStringList(key, value);
  }

  static List<String>? getStringList({required String key}) {
    return _instance.getStringList(key);
  }

  static void clear() async {
    await _instance.clear();
  }

  static void remove(String key) async {
    await _instance.remove(key);
  }

  static void deleteListOfStrings(String key) async {
    await _instance.remove(key);
  }
}
