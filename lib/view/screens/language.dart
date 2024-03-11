import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/core/constant/routes.dart';
import 'package:help_me_talk/core/localization/changelocal.dart';
import 'package:help_me_talk/view/widgets/language/custombuttomlang.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr,
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(
              height: 20,
            ),
            CustomBottomLang(
              textbutton: "Ar",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            CustomBottomLang(
              textbutton: "En",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
