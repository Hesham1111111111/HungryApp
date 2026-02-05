import 'package:shared_preferences/shared_preferences.dart';

class PrefHelpers {
  static const String _tokenKey = "auth_token";

  static Future<void> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_tokenKey);
  }
}
