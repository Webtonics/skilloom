import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hinttext,
      required this.keyboardtype});
  final TextEditingController controller;
  final String label;
  final String hinttext;
  final TextInputType keyboardtype;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: null,
        label: Text(label),
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        fillColor: Colors.white54,
        filled: true,
      ),
    );
  }
}
