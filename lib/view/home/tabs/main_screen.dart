import 'package:flutter/material.dart';
import 'package:help_me_talk/view/home/category.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CategoryForHomeScreen(),
      ],
    );
  }
}
