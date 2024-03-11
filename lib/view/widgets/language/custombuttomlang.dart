import 'package:flutter/material.dart';
import 'package:help_me_talk/core/constant/color.dart';

class CustomBottomLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomBottomLang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return        Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
