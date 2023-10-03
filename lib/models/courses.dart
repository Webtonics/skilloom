import 'package:cloud_firestore/cloud_firestore.dart';

class Courses {
  final String courseId;
  final String title;
  final String description;
  final lessons; // list of videos
  final studentEnrolled; //list of students
  final String instructor;
  final assignments;
  final quizzes;
  final String thumbnail;

  Courses(
      {required this.courseId,
      required this.title,
      required this.description,
      this.lessons,
      required this.thumbnail,
      this.studentEnrolled,
      required this.instructor,
      this.assignments,
      this.quizzes});

  //to json
  Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "title": title,
        "description": description,
        "lesson": lessons,
        "studentEnrolled": studentEnrolled,
        "instructor": instructor,
        "assignment": assignments,
        "quizzes": quizzes,
        "thumbnail": thumbnail
      };

  //to object
  static Courses fromJson(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Courses(
        courseId: snapshot['courseId'],
        title: snapshot['title'],
        description: 'description',
        instructor: 'instructor',
        lessons: snapshot['lessons'],
        studentEnrolled: snapshot["studentEnrolled"],
        assignments: snapshot["assignment"],
        quizzes: snapshot["quizzes"],
        thumbnail: snapshot['thumbnail']);
  }
}
