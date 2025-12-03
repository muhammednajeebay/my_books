import 'package:flutter/foundation.dart';
import 'package:my_books/services/auth_service.dart';
import '../models/user.dart';

/// Authentication Controller using Provider for state management
/// Handles login, logout, and persistent authentication state
class AuthController extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;

  // Call the auth service to login
  final authService = AuthService();

  // Getters
  UserModel? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AuthController() {
    init();
  }

  void init() async {
    await _loadUserFromStorage();
  }

  /// Load user from SharedPreferences on app start
  Future<void> _loadUserFromStorage() async {
    try {
      print(' Loading user from storage...');
      var data = await authService.getUser();
      if (data != null) {
        _user = data;
        notifyListeners();
      }
    } catch (e) {
      print('Error loading user from storage: $e');
    }
  }

  /// Login with email and password
  /// For demo purposes, accepts any non-empty credentials
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Basic validation
      if (email.isEmpty || password.isEmpty) {
        _errorMessage = 'Please enter both email and password';
        _isLoading = false;
        notifyListeners();
        return false;
      }
      UserModel user = UserModel(
        email: email,
        name: email.split('@').first, // Extract name from email
      );

      final result = await authService.login(user);

      if (result) {
        _user = user;
      }

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Login failed: ${e.toString()}';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Logout user and clear stored data
  Future<void> logout() async {
    try {
      await authService.onLogout();
      _user = null;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  /// Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
