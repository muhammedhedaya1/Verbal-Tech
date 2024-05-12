import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/core/cache_helper.dart';
import 'package:help_me_talk/core/services/services.dart';
import 'package:help_me_talk/core/shared/network/firebase/firebase_notifications.dart';
import 'package:help_me_talk/firebase_options.dart';
import 'package:help_me_talk/routes.dart';
import 'package:help_me_talk/view/screens/auth/choisescreenforloginorsignup.dart';
import 'package:help_me_talk/view/screens/onboardingprefect/screen_one.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await FirebaseNotifications().initNotifications();

  await CacheHelper().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CacheHelper().getData(key: "isOnBoardingVisited") ?? false
          ? ChoiseScreenForLoginOrSignUp()
          : OnboardingScreenOne(),
      // Show onboarding screens only for the first time
      routes: routes,
    );
  }
}
