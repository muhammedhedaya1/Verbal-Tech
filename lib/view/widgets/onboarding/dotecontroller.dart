import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/controller/onboarding_controller.dart';
import 'package:help_me_talk/core/constant/color.dart';
import 'package:help_me_talk/data/datasource/static/static.dart';

class CustomDoteControllerOnBoarding extends StatelessWidget {
  const CustomDoteControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnBoardingControllerImp>(builder: (controller)=>Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          onBoardingList.length,
              (index) => AnimatedContainer(
            margin: const EdgeInsets.only(right: 5),
            duration: const Duration(milliseconds: 900),
            width: controller.currentPage==index?20:5,
            height: 6,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    ),) ;
  }
}
