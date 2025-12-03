import 'package:my_books/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _userKey = 'user_email';
  static const String _userNameKey = 'user_name';
  Future<bool> login(UserModel user) async {
    try {
      // Save to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userKey, user.email);
      await prefs.setString(_userNameKey, user.name ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString(_userKey);
      final name = prefs.getString(_userNameKey);
      if (email != null) {
        return UserModel(email: email, name: name);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> onLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_userNameKey);
  }
}
