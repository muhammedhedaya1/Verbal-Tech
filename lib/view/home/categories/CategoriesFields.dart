import 'package:flutter/material.dart';
import 'package:help_me_talk/core/constant/color.dart';
import 'package:help_me_talk/view/home/categories/CategoryWidget.dart';
import 'package:help_me_talk/view/home/categories/category.dart';

typedef OnCategoryClick = void Function(Category category);

class CategoriesFields extends StatefulWidget {
  final OnCategoryClick onCategoryClick;
  CategoriesFields(this.onCategoryClick, {Key? key}) : super(key: key);

  @override
  State<CategoriesFields> createState() => _CategoriesFieldsState();
}

class _CategoriesFieldsState extends State<CategoriesFields> {
  List<Category> categories = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(height: 20), // Add space above the text
          Center(
            child: const Text(
              "♥🙏 نحن هنا لمساعدتك",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: AppColor.blue),
            ),
          ),
          SizedBox(height: 30), // Add space below the text
          SizedBox(
            height: 700, // Provide a specific height
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  widget.onCategoryClick(categories[index]);
                },
                child: CategoryItem(categories[index], index),
              ),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
