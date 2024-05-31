import 'package:flutter/material.dart';

class Category {
  String? title;
  String? image;
  Color? color;

  Category(this.title, this.image, this.color);

 static List<Category> getCategories() {
    return [
      Category(
          "تقدم طفلي", "assets/images/childprocess.png", Color(0xFF6B9FBC)),
      Category("نصائح من الاخصائي", "assets/images/family-confirming.png",
          Color(0xFFABE1E0)),
      Category(
          "الدروس", "assets/images/videolession.png", Color(0xFFABE1E0)),
      // Category("المواعيد", "assets/images/calendar.png", Color(0xFF41C8E1)),
      Category("التواصل مع الأخصائي", "assets/images/mail-part.png",
          Color(0xFF79C6E0)),
      Category("التمارين الوارده", "assets/images/question.png", Color(0xFF6B9FBC)),
    ];
  }
}
