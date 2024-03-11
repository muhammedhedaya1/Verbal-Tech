import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/core/constant/routes.dart';

abstract class LoginController extends GetxController{
  login();
  gotoSignUp();
  gotoForgetPasswordForDoctor();
}
class LoginControllerImp extends LoginController{
 late TextEditingController email;
 late TextEditingController password;
  @override
  login() {}

  @override
  gotoSignUp() {
    Get.toNamed(AppRoute.SignUpForDoctor);
  }
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotoForgetPasswordForDoctor() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}