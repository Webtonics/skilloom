import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skilloom/providers/user_provider.dart';
// import 'package:skilloom/views/app_screen/home.dart';
import 'package:skilloom/views/auth/login.dart';
import 'package:skilloom/views/router.dart';

import 'firebase_options.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Skilloom App',
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.deepPurple,
              elevation: 1,
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const MyAppRoute();
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
