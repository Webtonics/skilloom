import 'package:cloud_firestore/cloud_firestore.dart';
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
  late Future<void> _init;
  @override
  void initState() {
    _init = addUserProvider();
    super.initState();
  }

  //function to add user provider
  addUserProvider() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          User? user = Provider.of<UserProvider>(context).getUser;
          // User? user = context.read<UserProvider>().getUser;
          if (snapshot.hasData == false) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        const Text("Settings"),
                        Expanded(child: Text(user.displayName)),
                        Expanded(child: Text(user.email)),
                        Text(user.role),
                        Text(user.uid),
                        // Expanded(
                        //     child: Image(image: NetworkImage(user.photoURL))),
                        IconButton(
                            onPressed: () {
                              AuthService().signout();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const LoginScreen())));
                            },
                            icon: const Icon(Icons.logout))
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
