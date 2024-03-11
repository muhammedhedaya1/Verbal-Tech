import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/controller/onboarding_controller.dart';
import 'package:help_me_talk/core/constant/color.dart';

class CustomButtonOnBoarding extends GetView <OnBoardingControllerImp>{
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(
            horizontal: 130, vertical: 2),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        color: AppColor.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)
        ),
        child:const Text(
          "Countine",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
