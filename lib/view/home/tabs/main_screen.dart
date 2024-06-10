import 'package:flutter/material.dart';
import 'package:help_me_talk/view/home/categories/CategoriesFields.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: CategoriesFields((category) {
              // Handle category click
            }),
          ),
        ],
      ),
    );
  }
}
