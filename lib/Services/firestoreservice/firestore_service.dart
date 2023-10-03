import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get all courses
  Stream<QuerySnapshot<Map<String, dynamic>>> getallCourses() {
    Stream<QuerySnapshot<Map<String, dynamic>>> documentSnapshot =
        _firestore.collection('courses').snapshots();
    return documentSnapshot;
  }
}
