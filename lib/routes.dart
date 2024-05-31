import 'package:flutter/material.dart';
import 'package:help_me_talk/view/screens/auth/forgetpasswordforparent.dart';
import 'package:help_me_talk/view/screens/auth/loginforparent.dart';
import 'package:help_me_talk/view/screens/auth/signupforparent.dart';
import 'core/constant/routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //Auth
  AppRoute.SignUpForDoctor:(context)=> const SignUp(),
  AppRoute.DoctorLoginPage:(context)=> const LoginForParent(),
  AppRoute.forgetPassword:(context)=> const ForgotPassword(),
  AppRoute.logininforpatient:(context)=> const LoginForParent(),
};
