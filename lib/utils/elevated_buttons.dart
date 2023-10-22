import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyElevattedButton extends StatelessWidget {
  const MyElevattedButton({
    super.key,
    this.color = Colors.deepPurple,
    required this.title,
    required this.action,
  });
  final String title;
  final VoidCallback action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), side: BorderSide.none),
          backgroundColor: color,
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        ));
  }
}
