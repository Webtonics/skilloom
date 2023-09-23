import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skilloom/views/app_screen/home.dart';
import 'package:skilloom/views/auth/login.dart';
import 'package:skilloom/views/router.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skilloom App',
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.deepPurple,
            elevation: 1,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey),
      ),
      home: const LoginScreen(),
    );
  }
}
