import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_me_talk/controller/auth/login_controller.dart';
import 'package:help_me_talk/core/constant/color.dart';
import 'package:help_me_talk/data/model/categoryitem.dart';
import 'package:help_me_talk/view/home/homescreen.dart';
import 'package:help_me_talk/view/widgets/auth/CustomButtomAuth.dart';
import 'package:help_me_talk/view/widgets/auth/customtextbodyauth.dart';
import 'package:help_me_talk/view/widgets/auth/customtextformauth.dart';
import 'package:help_me_talk/view/widgets/auth/customtexttitleauth.dart';
import 'package:help_me_talk/view/widgets/auth/logoauth.dart';
import 'package:help_me_talk/view/widgets/auth/textsignup.dart';

import '../../../data/model/drawer_screen.dart';

class DoctorLoginPage extends StatelessWidget {
  const DoctorLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text(
          "Login",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(
        color: AppColor.background,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const LogoAuth(),
            const CustomTextTitleAuth(
              text: "Welcome Back",
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextBodyAuth(
              text:
                  "Login With Your Email and Password\n Or Continue With Social Media Account",
            ),
            const SizedBox(
              height: 25,
            ),
             CustomTextFormAuth(
              mycontroller: controller.email,
              hinttext: "enter your email",
              iconData: Icons.email,
              labeltext: "Email",
            ),
             CustomTextFormAuth(
              mycontroller: controller.password,
              hinttext: "password",
              iconData: Icons.lock,
              labeltext: "Password",
            ),
            InkWell(
              onTap:() {
                controller.gotoForgetPasswordForDoctor();
              },
              child: const Text(
                "Forger Password ?",
                textAlign: TextAlign.end,
              ),
            ),
            CustomButtomAuth(
              text: "Login",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return HomeScreen();
                }));
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextSignUpOrLogin(
              textone: "Don't have an account?",
              texttwo: "SignUp",
              onTap: (){
                controller.gotoSignUp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
