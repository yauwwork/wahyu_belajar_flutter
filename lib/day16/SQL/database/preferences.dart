import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  // Inisialisasi Shared Preference
  static final PreferenceHandler _instance = PreferenceHandler._internal();
  late SharedPreferences _preferences;

  factory PreferenceHandler() => _instance;

  PreferenceHandler._internal();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Key user
  static const String _isLogin = 'isLogin';
  static const String _token = 'token';

  // ==================== IS LOGIN ====================

  // CREATE
  Future<void> storingIsLogin(bool isLogin) async {
    _preferences.setBool(_isLogin, isLogin);
  }

  // GET
  static Future<bool?> getIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLogin);
  }

  // DELETE
  Future<void> deleteIsLogin() async {
    await _preferences.remove(_isLogin);
  }

  // ==================== TOKEN ====================

  // CREATE
  Future<void> storingToken(String token) async {
    await _preferences.setString(_token, token);
  }

  // GET
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  // DELETE
  Future<void> deleteToken() async {
    await _preferences.remove(_token);
  }
}