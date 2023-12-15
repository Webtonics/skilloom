import 'package:flutter/material.dart';
import 'package:skilloom/Services/authservice/user_services.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  final AuthService _authService = AuthService();

  // Updated getter to return a nullable User
  User? get getUser => _user;
  bool get isLoading => _isLoading;

  Future<void> refreshUser() async {
    _isLoading = true;
    notifyListeners();

    try {
      User user = await _authService.getUserDetails();
      _user = user;
    } catch (error) {
      print("Error fetching user data from where: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
