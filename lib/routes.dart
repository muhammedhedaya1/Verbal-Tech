import 'package:flutter/material.dart';
import 'package:help_me_talk/view/screens/auth/choisescreenforloginorsignup.dart';
import 'package:help_me_talk/view/screens/auth/forgetpasswordfordoctor.dart';
import 'package:help_me_talk/view/screens/auth/loginfordoctor.dart';
import 'package:help_me_talk/view/screens/auth/signupfordoctor.dart';
import 'core/constant/routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //OnBoarding
  AppRoute.ChoiseScreenForLoginOrSignUp: (context) => const ChoiseScreenForLoginOrSignUp() ,
  //Auth
  AppRoute.SignUpForDoctor:(context)=> const SignUp(),
  AppRoute.DoctorLoginPage:(context)=> const LogIn(),
  AppRoute.forgetPassword:(context)=> const ForgotPassword(),
  // AppRoute.logininforpatient:(context)=> const logininforpatient(),
};
