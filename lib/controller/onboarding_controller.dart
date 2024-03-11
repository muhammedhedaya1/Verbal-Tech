import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/core/constant/routes.dart';
import 'package:help_me_talk/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;

  @override
  next() {
    currentPage++;
    if(currentPage>onBoardingList.length-1){
      Get.offAllNamed(AppRoute.ChoiseScreenForLoginOrSignUp);
    }else{
      pageController.animateToPage(currentPage, duration:const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
