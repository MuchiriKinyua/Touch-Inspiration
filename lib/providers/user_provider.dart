import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<User> _users = [];
  bool _isLoading = false;

  List<User> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      _users = await _apiService.fetchUsers();
    } catch (error) {
      print("Error fetching users: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update user
  Future<void> updateUser(String id, Map<String, dynamic> updatedData) async {
    try {
      User updatedUser = await _apiService.updateUser(id, updatedData);
      int index = _users.indexWhere((user) => user.id == id);
      if (index != -1) {
        _users[index] = updatedUser;
      }
      notifyListeners();
    } catch (error) {
      print("Error updating user: $error");
    }
  }
}
