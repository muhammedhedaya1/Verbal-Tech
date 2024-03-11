import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/controller/onboarding_controller.dart';
import 'package:help_me_talk/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          const Gap(100),
          Image.asset(
            onBoardingList[i].image!,
            // width: 300,
            // height: 300,
            // fit: BoxFit.fill,
          ),
          const Gap(100),
          Text(
            onBoardingList[i].title!,
            style: Theme.of(context).textTheme.headline1,
          ),
          const Gap(50),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
