import 'package:flutter/material.dart';
import 'package:help_me_talk/data/model/CategoryData.dart';
import 'package:help_me_talk/data/model/categoryitem.dart';

class CategoryForHomeScreen extends StatelessWidget {
  const CategoryForHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = CategoryData.getCategories();
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(30),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return CategoryItem(categories[index], index);
          },
        ),
      ),
    );
  }
}
