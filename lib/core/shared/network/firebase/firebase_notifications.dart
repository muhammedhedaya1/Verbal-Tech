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

  //*handle notifications when recieved
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
  }

  Future<void> handleBackgroundNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
