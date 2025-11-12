import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../services/user_api_service.dart';
import '../database/db_helper.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  final UserApiService _apiService = UserApiService();

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final loginSuccess = await _apiService.login(email, password);
    
    if (loginSuccess) {
      final user = await _apiService.fetchUser(1);
      if (user != null) {
        _currentUser = user;
        await DBHelper.insertOrUpdateUser(user);
      }
    }

    _isLoading = false;
    notifyListeners();
    return loginSuccess && _currentUser != null;
  }

  Future<bool> updateUser(User user) async {
    _isLoading = true;
    notifyListeners();

    final success = await _apiService.updateUser(user);
    
    if (success) {
      _currentUser = user;
      await DBHelper.insertOrUpdateUser(user);
    }

    _isLoading = false;
    notifyListeners();
    return success;
  }

  Future<void> loadCurrentUser() async {
    _currentUser = await DBHelper.getCurrentUser();
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    DBHelper.clearUserData();
    notifyListeners();
  }
}