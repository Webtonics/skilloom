import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skilloom/Services/authservice/user_services.dart';
import 'package:skilloom/Services/hyperlink/hyperlink_sevice.dart';
import 'package:skilloom/constants/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

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
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text(
          " Do you Need help?",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            spacingH,
            Expanded(
              flex: 2,
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
            ),
            spacingH,
            Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                          "Skilloom is an Asynchronous Elearning App developed for my final year Project.",
                          style: GoogleFonts.poppins(
                              fontSize: 19, fontWeight: FontWeight.w500)),
                      spacingH,
                      Text(
                          "The app helps to Connect Teachers such as Lecturers and student",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                )),
            spacingH,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // _launchURL();
            LinkService()
                .launchURL("https://chat.whatsapp.com/IR3D78azfzvGoSGPgPSS4u");
          },
          child: const Icon(Icons.contact_support)
          // const Text("Chat ")
          ),
    );
  }
}
