import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String uid;
  final String email;
  final String displayName;
  final String? photoURL;
  final String role;
  User({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoURL,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'role': role,
    };
  }

  static User fromFireJson(DocumentSnapshot snap) {
    var snaphot = snap.data() as Map<String, dynamic>;
    return User(
        photoURL: snaphot['photoUrl'],
        uid: snaphot['uid'],
        email: snaphot['email'],
        displayName: snaphot['displayName'],
        role: snaphot['role']);
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      email: map['email'] as String,
      displayName: map['displayName'] as String,
      // photoURL: map['photoURL'] != null ? map['photoURL'] as String : null,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
