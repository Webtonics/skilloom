import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Do you Need help?",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Text("Help"),
          ),

          //video
          const Text(
              "Skilloom is an Asynchronous Elearning App developed for my final year Project."),
          const Text(
              "The app helps to Connect Teachers such as Lecturers and student"),
          Container(
            color: Colors.deepOrange,
            width: double.infinity,
            height: 400,
            child: const Center(
                child: Text(
              "Video of help ",
              style: TextStyle(color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}
