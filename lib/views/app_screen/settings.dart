import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilloom/Services/authservice/user_services.dart';
import 'package:skilloom/providers/user_provider.dart';
import 'package:skilloom/views/auth/login.dart';

import '../../models/user_model.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text("Settings"),
              // Text(user.displayName),
              // Text(user.email),
              // Text(user.role),
              // Text(user.uid),
              // Image(image: NetworkImage(user.photoURL!)),
              IconButton(
                  onPressed: () {
                    AuthService().signout();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) => const LoginScreen())));
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
        ),
      ),
    );
  }
}
