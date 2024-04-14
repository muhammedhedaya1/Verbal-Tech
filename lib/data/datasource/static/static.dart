import 'package:help_me_talk/core/constant/imagesasset.dart';
import 'package:help_me_talk/data/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "بداية الرحلة",
      body:
          "اتخذ خطوة نحو صحة نفسية أفضل.\n نحن هنا لدعمك.",
      image:AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "محاضرات اونلاين",
      body:
          "راقب عواطفك بسهولة يوميًا. افهم مشاعرك، وتحكم في صحتك العقلية.",
      image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: "متابعة مع الدكتور",
      body: "الوصول إلى خطوات قيمة في برنامج العلاج الخاص بك",
      image: AppImageAsset.onBoardingImageThree)
];
