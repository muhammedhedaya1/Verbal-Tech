import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/controller/onboarding_controller.dart';
import 'package:help_me_talk/view/widgets/onboarding/custombutton.dart';
import 'package:help_me_talk/view/widgets/onboarding/customslider.dart';
import 'package:help_me_talk/view/widgets/onboarding/dotecontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children:[
             Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDoteControllerOnBoarding(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
