import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/controller/auth/forgetpasswordfordoctor_controller.dart';
import 'package:help_me_talk/core/constant/color.dart';
import 'package:help_me_talk/view/widgets/auth/CustomButtomAuth.dart';
import 'package:help_me_talk/view/widgets/auth/customtextformauth.dart';
import 'package:help_me_talk/view/widgets/auth/customtexttitleauth.dart';
class ForgetPasswordForDoctor extends StatelessWidget {
  const ForgetPasswordForDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerForDoctorControllerImp controller= Get.put(ForgetPasswordControllerForDoctorControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text(
          "Forget Password",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            Image.asset(
              "assets/images/onboarding_signupdoctor.png",
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 50,
            ),
            const CustomTextTitleAuth(
              text: "Check Email ",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormAuth(
              mycontroller: controller.phoneoremail,
              hinttext: "Phone Or Email",
              iconData: Icons.phone,
              labeltext: "Phone Or Email",
            ),
            CustomButtomAuth(
              text: "Check Your Email Or Phone",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
