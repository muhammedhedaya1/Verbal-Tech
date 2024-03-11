import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/controller/auth/signup_controller.dart';
import 'package:help_me_talk/core/constant/color.dart';
import 'package:help_me_talk/view/widgets/auth/CustomButtomAuth.dart';
import 'package:help_me_talk/view/widgets/auth/customtextformauth.dart';
import 'package:help_me_talk/view/widgets/auth/customtexttitleauth.dart';
import 'package:help_me_talk/view/widgets/auth/textsignup.dart';

class SignUpForDoctor extends StatelessWidget {
  const SignUpForDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text(
          "Sign Up",
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
              height: 20,
            ),
            const CustomTextTitleAuth(
              text: "Welcome",
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextFormAuth(
              mycontroller: controller.doctorname,
              hinttext: "enter your name",
              iconData: Icons.person,
              labeltext: "Doctor",
            ),
            CustomTextFormAuth(
              mycontroller: controller.phoneoremail,
              hinttext: "Phone Or Name",
              iconData: Icons.phone,
              labeltext: "Phone Or Email",
            ),
            CustomTextFormAuth(
              mycontroller: controller.password,
              hinttext: "password",
              iconData: Icons.password,
              labeltext: "Password",
            ),
            CustomTextFormAuth(
              mycontroller: controller.confirmpassword,
              hinttext: "password",
              iconData: Icons.password,
              labeltext: "Confirm Password",
            ),
            const Text(
              "By registering you agree to Terms & Conditions\n and Privacy Policy of the Vermo",
              textAlign: TextAlign.center,
            ),
            CustomButtomAuth(
              text: "Sign Up",
              onPressed: () {},
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextSignUpOrLogin(
              textone: "have an account?",
              texttwo: "Login",
              onTap: () {
                controller.goToDoctorLoginPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
