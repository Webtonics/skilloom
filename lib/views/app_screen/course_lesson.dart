import 'package:flutter/material.dart';

class CourseLesson extends StatefulWidget {
  const CourseLesson({super.key});

  @override
  State<CourseLesson> createState() => _CourseLessonState();
}

class _CourseLessonState extends State<CourseLesson> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("CourseLesson"),
      ),
    );
  }
}
