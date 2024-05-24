import 'package:flutter/material.dart';
import 'package:help_me_talk/view/home/categories/CategoriesFields.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesFields((category) {
          // Handle category click here
        }),
      ],
    );
  }
}
