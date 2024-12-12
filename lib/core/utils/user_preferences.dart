import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _memberTokenKey = 'member_token';
  static const String _userTokenKey = 'user_token';

  Future<void> saveMemberToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_memberTokenKey, token);
  }

  Future<String?> getMemberToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_memberTokenKey);
  }

  Future<void> removeMemberToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_memberTokenKey);
  }

  Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userTokenKey, token);
  }

  Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userTokenKey);
  }

  Future<void> removeUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_userTokenKey);
  }
}