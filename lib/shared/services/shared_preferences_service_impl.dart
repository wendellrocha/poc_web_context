import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_service.dart';

class SharedPreferencesServiceImpl implements LocalStorageService {
  final SharedPreferences _prefs;

  const SharedPreferencesServiceImpl(this._prefs);

  @override
  Future<void> reload() async {
    await _prefs.reload();
  }

  @override
  Map<String, dynamic>? getObject(String key) {
    if (_prefs.getString(key) != null) {
      return json.decode(_prefs.getString(key)!);
    } else {
      return null;
    }
  }

  @override
  void setObject(String key, value) async {
    _prefs.setString(key, json.encode(value));
  }

  @override
  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  @override
  void setBool(String key, bool b) {
    _prefs.setBool(key, b);
  }

  @override
  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  @override
  void setInt(String key, int i) async {
    _prefs.setInt(key, i);
  }

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  void setString(String key, String s) {
    _prefs.setString(key, s);
  }

  @override
  void remove(String key) {
    _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    _prefs.clear();
  }
}
