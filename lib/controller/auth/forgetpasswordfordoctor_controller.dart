import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/core/constant/routes.dart';

abstract class ForgetPasswordControllerForDoctor extends GetxController{
  checkemailorphone();
  goToVerfiyCode();
}
class ForgetPasswordControllerForDoctorControllerImp extends ForgetPasswordControllerForDoctor{
  late TextEditingController phoneoremail;

  @override
  checkemailorphone() {}

  @override
  goToVerfiyCode() {
    Get.offNamed(AppRoute.verfiyCode);
  }
  @override
  void onInit() {
    phoneoremail= TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    phoneoremail.dispose();
    super.dispose();
  }
}