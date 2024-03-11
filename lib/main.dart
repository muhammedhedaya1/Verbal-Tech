import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/core/constant/color.dart';
import 'package:help_me_talk/core/localization/translation.dart';
import 'package:help_me_talk/core/services/services.dart';
import 'package:help_me_talk/routes.dart';
import 'package:help_me_talk/view/screens/language.dart';
import 'core/localization/changelocal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller =Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: AppColor.blue),
            headline2: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: AppColor.blue),
            bodyText1: TextStyle(
                height: 2,
                color: AppColor.gray,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        primarySwatch: Colors.grey,
      ),
      home: const Language(),
      routes: routes,
    );
  }
}
