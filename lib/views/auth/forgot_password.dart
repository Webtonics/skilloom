import 'package:flutter/material.dart';
import 'package:skilloom/Services/authservice/auth_exception.dart';
import 'package:skilloom/Services/authservice/user_services.dart';
import 'package:skilloom/constants/spacing.dart';
import 'package:skilloom/utils/elevated_buttons.dart';
import 'package:skilloom/utils/textfiels.dart';

import '../../utils/error_dialog.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  // bool _isLoading = false;

  void _resetPassword() async {
    // String res = "an error occurred";
    // setState(() {
    //   _isLoading = true;
    // });
    try {
      await AuthService().forgotPassword(_emailController.text);
      // res = "Sucessful";
    } on InvalidEmailAuthException {
      showDialog(
          context: context,
          builder: (context) {
            return const MyErrorDialog(
              title: "Invalid Email",
              content:
                  "The Email address you provided is invalid. Try again with a correct email. Please try again",
            );
          });
    }

    // setState(() {
    //   _isLoading = false;
    // });
    // if (res == 'Successful') {
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //       content: Text("Password reset Email Sent. Check your inbox")));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              MyTextField(
                  controller: _emailController,
                  label: "Email address",
                  hinttext: "Enter your Email address",
                  keyboardtype: TextInputType.emailAddress,
                  enabled: true),
              spacingH,
              spacingH,
              // _isLoading
              // ? ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       minimumSize: const Size(double.infinity, 50),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12),
              //           side: BorderSide.none),
              //       backgroundColor: Colors.deepPurple,
              //     ),
              // child: const CircularProgressIndicator(
              //   color: Colors.white,
              // ),
              // )
              // :
              ElevatedButton(
                onPressed: () {
                  AuthService().forgotPassword(_emailController.text);
                  try {} catch (e) {}
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide.none),
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text("Password Reset"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
