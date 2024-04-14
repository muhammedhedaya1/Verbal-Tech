import 'package:flutter/material.dart';
import 'package:help_me_talk/view/screens/auth/choisescreenforloginorsignup.dart';
import 'package:help_me_talk/view/screens/auth/forgetpasswordfordoctor.dart';
import 'package:help_me_talk/view/screens/auth/loginfordoctor.dart';
import 'package:help_me_talk/view/screens/auth/signupfordoctor.dart';
import 'package:help_me_talk/view/screens/onboarding.dart';
import 'core/constant/routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //OnBoarding
  AppRoute.ChoiseScreenForLoginOrSignUp: (context) => const ChoiseScreenForLoginOrSignUp() ,
  AppRoute.onBoarding: (context) => const OnBoarding() ,
  //Auth
  AppRoute.SignUpForDoctor:(context)=> const SignUpForDoctor(),
  AppRoute.DoctorLoginPage:(context)=> const DoctorLoginPage(),
  AppRoute.forgetPassword:(context)=> const ForgetPasswordForDoctor(),
  // AppRoute.logininforpatient:(context)=> const logininforpatient(),
};
