import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  const CustomTextFormAuth({super.key, required this.hinttext, required this.labeltext, required this.iconData, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hinttext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
          suffixIcon:Icon(iconData) ,
          label: Container(
              margin: EdgeInsets.symmetric(horizontal: 9),
              child: Text(labeltext)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
          ),
        ),
      ),
    );
  }
}
