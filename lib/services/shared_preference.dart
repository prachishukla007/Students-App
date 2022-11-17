import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class Preferences {
  Future<SharedPreferences> _getSharedPreference() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> getString(String key) async {
    var prefs = await _getSharedPreference();
    return prefs.getString(key) ?? '';
  }

  Future<void> setString(String key, String value) async {
    var prefs = await _getSharedPreference();
    await prefs.setString(key, value);
  }
}