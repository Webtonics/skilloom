import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  final String lessonId;
  final String courseId;
  final String title;
  final String description;
  final String videoUrl;
  final String note;
  final List learner;
  //road map => i will add: final List learner; to track all viewers
  Lesson(
      {required this.lessonId,
      required this.title,
      required this.description,
      required this.videoUrl,
      required this.note,
      required this.learner,
      required this.courseId});

  //map to obj

  //obj to map
  Map<String, dynamic> toJson() => {
        'lessonId': lessonId,
        'title': title,
        'description': description,
        'videoUrl': videoUrl,
        'note': note,
        'learner': learner
      };

  static Lesson fromJson(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return Lesson(
        lessonId: snap['lessonId'],
        title: snap['title'],
        description: snap['description'],
        videoUrl: snap['videoUrl'],
        note: snap['note'],
        learner: snap['learner'],
        courseId: snap['courseId']);
  }
}
