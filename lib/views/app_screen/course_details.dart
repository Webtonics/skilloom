import 'package:flutter/material.dart';
import 'package:skilloom/Services/hyperlink/hyperlink_sevice.dart';

import '../../constants/spacing.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key, required this.courseName, this.snap});

  final String courseName;
  final snap;

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.snap['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${widget.snap['thumbnail']}")),
              ),
            ),
            spacingH,
            Center(
              child: Text("${widget.courseName} information"),
            ),
            spacingH,
            Center(
              child: Text("${widget.snap['description']} "),
            ),
            spacingH
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          LinkService().launchURL(widget.snap['groupChat']);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
