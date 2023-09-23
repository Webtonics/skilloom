import 'package:flutter/material.dart';
import 'package:skilloom/Services/authservice/user_services.dart';
import 'package:skilloom/views/auth/login.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Settings"),
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
    );
  }
}
