import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cache.dart';

@Injectable(as: Cache)
class CacheImpl implements Cache {
  @override
  Future<bool?> getBool(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = sharedPreferences.getBool(key);
    if (kDebugMode) debugPrint("SharedPreference: get bool '$key' $value");
    return value;
  }

  @override
  Future<String?> getString(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = sharedPreferences.getString(key);
    if (kDebugMode) debugPrint("SharedPreference: get string '$key' $value");
    return value;
  }

  @override
  Future<int?> getInt(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = sharedPreferences.getInt(key);
    if (kDebugMode) debugPrint("SharedPreference: get int '$key' $value");
    return value;
  }

  @override
  Future setBool(String key, bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (kDebugMode) debugPrint("SharedPreference: saved bool '$key' $value");
    return sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool> setString(String key, String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (kDebugMode) debugPrint("SharedPreference: saved string '$key' $value");
    return await sharedPreferences.setString(key, value);
  }

  @override
  Future setInt(String key, int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (kDebugMode) debugPrint("SharedPreference: saved int '$key' $value");
    return sharedPreferences.setInt(key, value);
  }

  @override
  Future remove(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(key);
  }
}
