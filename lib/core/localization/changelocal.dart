import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/core/services/services.dart';

class LocalController extends GetxController{
  
  Locale? language;
  MyServices myServices= Get.find();
  
  changeLang(String langcode){
    Locale locale=Locale(langcode);
    myServices.sharedPreference.setString("Lang", langcode);
    Get.updateLocale(locale);
  }
  @override
  void onInit() {
    String? sharedPrefLang=myServices.sharedPreference.getString("lang");
    if (sharedPrefLang=="ar"){
      language=const Locale("ar");
    }else if (sharedPrefLang=="en"){
      language=const Locale("en");
    }else{
      language= Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
  
}