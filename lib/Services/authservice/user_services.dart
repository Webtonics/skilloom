import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:skilloom/Services/authservice/auth_exception.dart';
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
      sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyinUseAuthException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else if (e.code == "missing-password") {
        throw MissingPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
    return res;
  }

  //login user
  Future<String> signin(String email, String password) async {
    String res = ' An error occured';
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-login-credentials') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else if (e.code == 'missing-password') {
        throw MissingPasswordAuthException();
      } else {
        print(e.code);
        throw GenericAuthException();
      }
    } catch (e) {
      throw GenericAuthException();
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
    User currentUser = _auth.currentUser!;
    // print(currentUser.email);
    DocumentSnapshot documentSnapshot =
        await _firebaseFirestore.collection('users').doc(currentUser.uid).get();
    // var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    // print(snapshot['email']);
    // print(snapshot['photoURL']);
    // print(snapshot['displayName']);
    // print(snapshot['role']);

    return model.User.fromFireJson(documentSnapshot);
  }

  Future<void> updateUserInfo(String email, String username) async {
    User user = _auth.currentUser!;

    try {
      await _firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .update({'email': email, 'displayName': username});
    } catch (e) {
      print(e.toString());
    }
  }

  signout() {
    _auth.signOut();
  }

  Future<void> sendEmailVerification() async {
    await _auth.currentUser!.sendEmailVerification();
  }

  // Future<String> forgotPassword(String email) async {
  //   String res = "an error occurred";
  //   try {
  //     await _auth.sendPasswordResetEmail(email: email);
  //     res = "Successful";
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'invalid-email') {
  //       throw InvalidEmailAuthException();
  //     }
  //   }
  //   return res;
  // }
  Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else if (e.code == 'missing-email') {
        throw MissingEmailAuthException();
      } else {
        throw GenericAuthException();
      }
    }
  }
}
