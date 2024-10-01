import 'package:shared_preferences/shared_preferences.dart';

class ExpertPreferences {
  static const String _keyFirstName = 'FIRST_NAME';
  static const String _keyLastName = 'LAST_NAME';
  static const String _imageUrl = 'IMAGE_URL';
  static const String _keyToken = 'TOKEN';
  static const String _isLogin = 'IS_LOGIN';

  static Future<void> setUserInfo({String? firstName, String? lastName, String? token, String? imageUrl, bool? isLogin}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyFirstName, firstName!);
    await prefs.setString(_keyLastName, lastName!);
    await prefs.setString(_imageUrl, imageUrl!);
    await prefs.setString(_keyToken, token!);
    await prefs.setBool(_isLogin, isLogin!);
  }

  static Future<String?> getFirstName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyFirstName);
  }

  static Future<String?> getLastName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLastName);
  }

  static Future<String?> getImageUrl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_imageUrl);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  static Future<bool?> getIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLogin);
  }

  static Future<void> clearUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyFirstName);
    await prefs.remove(_keyLastName);
    await prefs.remove(_imageUrl);
    await prefs.remove(_keyToken);
    await prefs.setBool(_isLogin, false);
  }
}
