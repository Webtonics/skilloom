import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skilloom/Services/authservice/auth_exception.dart';
import 'package:skilloom/Services/authservice/user_services.dart';
import 'package:skilloom/utils/error_dialog.dart';
import 'package:skilloom/views/auth/forgot_password.dart';
import 'package:skilloom/views/auth/signup.dart';
import 'package:skilloom/views/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    setState(() {
      _isLoading = true;
    });
    try {
      await AuthService().signin(email, password);
    } on UserNotFoundAuthException {
      showDialog(
          context: context,
          builder: (context) {
            return const MyErrorDialog(
              title: " Account Not Found",
              content: "The details you provided cannot be found. try again",
            );
          });
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
    } on WrongPasswordAuthException {
      showDialog(
          context: context,
          builder: (context) {
            return const MyErrorDialog(
              title: " Wrong Password",
              content:
                  "The Password you provided is not associated with the account. Please try again",
            );
          });
    } on MissingPasswordAuthException {
      showDialog(
          context: context,
          builder: (context) {
            return const MyErrorDialog(
              title: " Missing Password",
              content: "The Password Field is missing please check again.",
            );
          });
    } on GenericAuthException {
      showDialog(
          context: context,
          builder: (context) {
            return const MyErrorDialog(
              title: " Unexpected Error",
              content:
                  "This is an Unexpected error. Please restart the app or contact us in our handle",
            );
          });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 20.0),
              _isLoading
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 70)),
                      onPressed: () {},
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 70)),
                      onPressed: _login,
                      child: const Text('Login'),
                    ),

              //bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => const SignUpScreen())));
                      },
                      child: const Text("Signup"))
                ],
              ),

              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                    },
                    child: const Text("Forgot password")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
