import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> upload(Uint8List item, String childname) async {
    String user = _auth.currentUser!.uid;
    //get reference
    Reference ref = _storage.ref("Profilepics").child(user);
    //upload task
    UploadTask uploadTask = ref.putData(item);

    //get task snapshot
    TaskSnapshot taskSnapshot = await uploadTask;

    //get download link
    String downloadUrl = await taskSnapshot.ref
        .getDownloadURL(); // get the sownload url for easy access by our db
    return downloadUrl;
  }
}
