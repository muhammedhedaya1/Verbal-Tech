import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/core/constant/routes.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToDoctorLoginPage();
}
class SignUpControllerImp extends SignUpController{
  late TextEditingController doctorname;
  late TextEditingController phoneoremail;
  late TextEditingController password;
  late TextEditingController confirmpassword;
  @override
  signUp() {}

  @override
  goToDoctorLoginPage() {
    Get.offNamed(AppRoute.DoctorLoginPage);
  }
  @override
  void onInit() {
    doctorname = TextEditingController();
    phoneoremail= TextEditingController();
    password = TextEditingController();
    confirmpassword = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    doctorname.dispose();
    phoneoremail.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }
}