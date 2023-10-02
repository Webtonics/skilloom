import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skilloom/Services/authservice/user_services.dart';
import 'package:skilloom/utils/error_dialog.dart';
import 'package:skilloom/views/auth/login.dart';
import 'package:skilloom/views/router.dart';

import '../../Services/authservice/auth_exception.dart';
import '../../Services/uploader/uploader.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Uint8List? image;
  bool _isloading = false;

  void _signup() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String res = "an error occured";

    setState(() {
      _isloading = true;
    });

    try {
      await AuthService().signup(username, email, "student", password, image!);
      res = "Success";
    } on EmailAlreadyinUseAuthException {
      showDialog(
          context: context,
          builder: (context) {
            return const MyErrorDialog(
              title: " Email Already in Use",
              content:
                  "The Email address you provided is associated with another account.",
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
    } on MissingPasswordAuthException {
      showDialog(
          context: context,
          builder: (context) {
            return const MyErrorDialog(
              title: " Missing Password",
              content: "The Password Field is missing please check again.",
            );
          });
    } on WeakPasswordAuthException {
      showDialog(
          context: context,
          builder: (context) {
            return const MyErrorDialog(
              title: " Weak Password",
              content:
                  "The Password you provided is not Secure try a combination of 8 (Letters/symbols/numbers). Please try again",
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

    if (res == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Verification email sent. Please check your inbox.')));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MyAppRoute()));
    }
    setState(() {
      _isloading = false;
    });
    print(res);
  }

  selectImage() async {
    Uint8List In = await pickimage(ImageSource.gallery);
    setState(() {
      image = In;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5, right: 16, bottom: 4, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                image != null
                    ? CircleAvatar(
                        radius: 60, backgroundImage: MemoryImage(image!))
                    : const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
                      ),
                IconButton(
                    onPressed: () {
                      selectImage();
                    },
                    icon: const Icon(Icons.add_a_photo))
              ]),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 10.0),

              // DropdownButtonFormField(items: [], onChanged: (){}),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 70)),
                  onPressed: () {
                    if (image != null && _usernameController.text.isNotEmpty) {
                      _signup();
                    } else if (_usernameController.text.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const MyErrorDialog(
                              title: "Enter a Username",
                              content:
                                  "You need to Enter your username to continue",
                            );
                          });
                    } else {
                      print("Null input");
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const MyErrorDialog(
                              title: "Upload a Profile picture",
                              content:
                                  "You need to upload a profile picture to continue",
                            );
                          });
                    }
                  },
                  child: _isloading
                      ? Center(
                          child: Container(
                            width: 20,
                            height: 20,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const Text('Sign Up'),
                ),
              ),

              //bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: ((context) => const LoginScreen())),
                            (route) => false);
                      },
                      child: const Text("Signin"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
