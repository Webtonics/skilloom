// import 'package:flutter/material.dart';
// import 'package:skilloom/Services/authservice/user_services.dart';

// import '../models/user_model.dart';

// class UserProvider with ChangeNotifier {
//   User? _user;

//   final AuthService _authService = AuthService();
//   User? get getUser => _user;

//   Future<void> refreshUser() async {
//     User? user = await _authService.getUserDetails();
//     _user = user;
//     notifyListeners();
//   }
// }
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
      // Handle any errors that occur during data fetching.
      print("Error fetching user data: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
