import 'package:help_me_talk/core/constant/imagesasset.dart';
import 'package:help_me_talk/data/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Welcome to Help Me Talk App",
      body:
          "Take a step towards better mental health.\n We are here to support you.",
      image:AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "Track Your Status",
      body:
          "Easily monitor your emotions daily. Understand your feelings, and take control of your mental well-being.",
      image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: "Access Valuable resources",
      body: "Access valuable steps in your treatment program",
      image: AppImageAsset.onBoardingImageThree)
];
