import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:skilloom/Services/storageservice/storage_service.dart';
import 'package:skilloom/models/user_model.dart' as model;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // final FirebaseStorage _storage = FirebaseStorage.instance;

  //Create User
  Future<String> signup(String displayName, String email, String role,
      String password, Uint8List profilePic) async {
    String res = "An Error Occured";

    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //storing our image
      String url =
          await StorageService().upload(profilePic, _auth.currentUser!.uid);
      model.User userinfo = model.User(
          displayName: displayName,
          role: role,
          email: email,
          uid: cred.user!.uid,
          photoURL: url);

      //adding to db
      await _firebaseFirestore
          .collection("users")
          .doc(cred.user!.uid)
          .set(userinfo.toMap());
      res = "Successful";
    } catch (e) {
      print(e.toString());
    }

    return res;
  }

  //login user
  Future<String> signin(String email, String password) async {
    String res = " An error occured";
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = "Success";
    } catch (e) {
      print(e.toString());
    }
    return res;
  }

  // Future<model.User> getUserDetails() async {
  //   User currentUser = _auth.currentUser!;
  //   DocumentSnapshot documentSnapshot =
  //       await _firebaseFirestore.collection('users').doc(currentUser.uid).get();
  //   return model.User.fromJson(documentSnapshot as String);
  // }

  Future<model.User> getUserDetails() async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      DocumentSnapshot documentSnapshot = await _firebaseFirestore
          .collection('users')
          .doc(currentUser.uid)
          .get();
      return model.User.fromFireJson(documentSnapshot);
    } else {
      // Handle the case where the user is not authenticated or currentUser is null.
      // You might want to return a default user or throw an error.
      throw Exception('User is not authenticated');
    }
  }

  signout() {
    _auth.signOut();
  }
}
