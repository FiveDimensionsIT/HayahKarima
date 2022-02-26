
import 'package:shared_preferences/shared_preferences.dart';

import '../cache_lib.dart';

///this requires the shared_preferences plugin
///in the pubspec.yaml file, under dependencies: add a line 'shared_preferences: ^0.5.0'
class LocalCacheService extends AbsCacheService {
  static SharedPreferences? _prefs;

  ///no problem calling it many times
  @override
  Future init() async {
    if (_prefs != null) return;
    _prefs = await SharedPreferences.getInstance();
  }

  ///you must call init() before calling it
  @override
  Future store(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  ///you must call init() before calling it
  @override
  String? retrieve(String key) {
    return _prefs!.getString(key);
  }

  ///you must call init() before calling it
  @override
  Future remove(String key) async {
    await _prefs!.remove(key);
  }

  ///you must call init() before calling it
  @override
  bool keyExists(String key) {
    return _prefs!.containsKey(key);
  }
}
