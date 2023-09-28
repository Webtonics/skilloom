import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilloom/Services/authservice/user_services.dart';
import 'package:skilloom/constants/colors.dart';
import 'package:skilloom/constants/spacing.dart';
import 'package:skilloom/providers/user_provider.dart';
import 'package:skilloom/utils/elevated_buttons.dart';
import 'package:skilloom/utils/textfiels.dart';
import 'package:skilloom/views/auth/login.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/user_model.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  // late Future<void> _init;
  @override
  void initState() {
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context).getUser;
    if (user != null) {
      return Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text("S E T T I N G S"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user.photoURL),
                ),
                //username
                spacingH,
                Expanded(
                  child: MyTextField(
                    controller: _usernameController,
                    label: "Username",
                    hinttext: user.displayName,
                    keyboardtype: TextInputType.text,
                  ),
                ),
                //email
                spacingH,
                MyTextField(
                  controller: _emailController,
                  // label: "Email Address",
                  label: "",
                  hinttext: user.email,
                  keyboardtype: TextInputType.emailAddress,
                ),
                spacingH,
                //Button
                MyElevattedButton(title: "Update Settings", action: () {}),

                spacingH,
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
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
