import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hinttext});
  final TextEditingController controller;
  final String label;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.white54,
        filled: true,
      ),
    );
  }
}
