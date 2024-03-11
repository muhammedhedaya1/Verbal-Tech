import 'package:flutter/material.dart';
import 'package:help_me_talk/core/constant/imagesasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logoAuthForDoctor,height: 250,);
  }
}
