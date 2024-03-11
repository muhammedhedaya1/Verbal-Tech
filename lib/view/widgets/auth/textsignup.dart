import 'package:flutter/material.dart';
import 'package:help_me_talk/core/constant/color.dart';

class CustomTextSignUpOrLogin extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSignUpOrLogin({super.key, required this.texttwo, required this.textone,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return             Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(
           texttwo,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
