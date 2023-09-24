import 'package:flutter/material.dart';
import 'package:skilloom/Services/authservice/user_services.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  final AuthService _authService = AuthService();
  User get getUser => _user!;
  // function to get uer details

  Future<void> refreshUser() async {
    User user = await _authService.getUserDetails();

    _user = user;
    notifyListeners();
  }
}
