import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessage {
  //get instance firbasemessaging
  final _firebasemessage = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    //get permission
    await _firebasemessage.requestPermission();
    //get token
    final fcmToken = await _firebasemessage.getToken();
    // print token
    print(" Token : $fcmToken");
  }
}
