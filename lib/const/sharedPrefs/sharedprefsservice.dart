import 'dart:convert';
import 'package:flutterweatherapp/domian/entity/weather_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  static LocalStorageServices? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageServices> getinstance() async {
    _instance ??= LocalStorageServices();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  Future<bool> _saveData(String key, dynamic value) {
    if (value is String) {
      return _preferences!.setString(key, value);
    }
    if (value is bool) {
      return _preferences!.setBool(key, value);
    }
    if (value is int) {
      return _preferences!.setInt(key, value);
    }
    if (value is double) {
      return _preferences!.setDouble(key, value);
    }
    if (value is List<String>) {
      return _preferences!.setStringList(key, value);
    }
    if (value is WeatherModel) {
      return _preferences!.setString(key, json.encode(value.toJson()));
    }
    throw  Exception('Unsupported value type');
  }
}