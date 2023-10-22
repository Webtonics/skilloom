import 'package:flutter/material.dart';

import '../../constants/spacing.dart';
import '../../constants/theme/theme.dart';
import '../../utils/elevated_buttons.dart';
import '../../widget/video_card_list.dart';

class CourseLesson extends StatefulWidget {
  const CourseLesson({
    super.key,
    this.snap,
  });
  final snap;
  @override
  State<CourseLesson> createState() => _CourseLessonState();
}

class _CourseLessonState extends State<CourseLesson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("video title"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.deepPurple),
                child: const Center(
                  child: Text("Video"),
                ),
              ),

              spacingH,
              const Center(
                child: Text(
                  "${"widget.courseName"} information",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              spacingH,
              const Center(
                child: Text("${"widget.snap['description']"} "),
              ),
              spacingH,
              MyElevattedButton(
                  title: "Full Note",
                  action: () {
                    // LinkService().launchURL(widget.snap['fullNote'], context);
                  }),
              spacingH,
              const Text(
                "All Lessons",
                style: headingSmall,
              ),
              spacingH,
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //       height: double.maxFinite,
              //       child: ListView.builder(
              //           itemCount: 10,
              //           itemBuilder: ((context, index) {
              //             return LessonList(
              //               index: index,
              //             );
              //           }))),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // LinkService().launchURL(widget.snap['groupChat'], context);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
