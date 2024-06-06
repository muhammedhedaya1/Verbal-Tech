import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  //*create instance of FBM
  final firebaseMessaging = FirebaseMessaging.instance;

  //* initialize notification for this aap
  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    String? token = await firebaseMessaging.getToken();
    print("Token: $token");
  }
}
