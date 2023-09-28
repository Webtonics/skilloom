import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skilloom/constants/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  _launchURL() async {
    const url = 'https://chat.whatsapp.com/IR3D78azfzvGoSGPgPSS4u';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          " Do you Need help?",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          spacingH,
          //video
          const Expanded(
            child: Text(
                "Skilloom is an Asynchronous Elearning App developed for my final year Project."),
          ),
          const Text(
              "The app helps to Connect Teachers such as Lecturers and student"),
          spacingH,
          Expanded(
            child: Container(
              color: Colors.deepPurple,
              width: double.infinity,
              height: 300,
              child: const Center(
                  child: Text(
                "Video of help ",
                style: TextStyle(color: Colors.white),
              )),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _launchURL();
          },
          child: const Icon(Icons.contact_support)
          // const Text("Chat ")
          ),
    );
  }
}
