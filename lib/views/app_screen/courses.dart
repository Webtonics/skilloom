import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Text("Courses"),
        child: Lottie.asset("assets/animation_lmxx36vm.json"),
      ),
    );
  }
}
