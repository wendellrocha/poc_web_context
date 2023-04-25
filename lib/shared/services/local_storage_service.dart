abstract class LocalStorageService {
  Future<void> reload();
  Map<String, dynamic>? getObject(String key);
  void setObject(String key, value);
  bool getBool(String key);
  void setBool(String key, bool b);
  int? getInt(String key);
  void setInt(String key, int i);
  String? getString(String key);
  void setString(String key, String s);
  void remove(String key);
  Future<void> clear();
}
