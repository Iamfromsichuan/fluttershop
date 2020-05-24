import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil{
  static StorageUtil _instance = new StorageUtil._();

  StorageUtil._();

  factory StorageUtil() => _instance;

  static SharedPreferences _prefs;

  static Future<void> init() async{
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setJson(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs.setString(key, jsonString);
  }

  dynamic getJson(String key) {
    String jsonString = _prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}