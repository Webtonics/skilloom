import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skilloom/Services/authservice/user_services.dart';
import 'package:skilloom/views/auth/login.dart';
import 'package:skilloom/views/router.dart';

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

    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      try {
        setState(() {
          _isloading = true;
        });
        await AuthService()
            .signup(username, email, "student", password, image!);
        res = "Success";
      } catch (e) {
        print(e.toString());
      }
    }

    if (res == "Success") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MyAppRoute()));
    }
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
      body: Padding(
        padding: const EdgeInsets.only(top: 5, right: 16, bottom: 4, left: 16),
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
            const SizedBox(height: 15.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 15.0),

            // DropdownButtonFormField(items: [], onChanged: (){}),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 70)),
                onPressed: _signup,
                child: _isloading
                    ? Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            value: 10,
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
    );
  }
}
