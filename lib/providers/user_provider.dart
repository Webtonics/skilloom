import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User get getUser => _user!;
  //function to get uer details

  // Future<void> refreshUser() async {
  //   User user = await getDetails();

  //   _user = user;
  //   notifyListeners();
  // }
}
