import 'package:flutter/material.dart';

class CategoryData {
  String? title;
  String? image;
  Color? color;

  CategoryData(this.title, this.image, this.color);

 static List<CategoryData> getCategories() {
    return [
      CategoryData(
          "تقدم طفلي", "assets/images/childprocess.png", Color(0xFF6B9FBC)),
      CategoryData("التوعية الأهلية", "assets/images/family-confirming.png",
          Color(0xFFABE1E0)),
      CategoryData(
          "الدروس", "assets/images/videolession.png", Color(0xFFABE1E0)),
      CategoryData("المواعيد", "assets/images/calendar.png", Color(0xFF41C8E1)),
      CategoryData("التواصل مع الأخصائي", "assets/images/mail-part.png",
          Color(0xFF79C6E0)),
      CategoryData("التخاطب", "assets/images/question.png", Color(0xFF6B9FBC)),
    ];
  }
}
