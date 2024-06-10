import 'package:flutter/material.dart';

class Category {
  String? title;
  String? image;
  Color? color;

  Category(this.title, this.image, this.color);

  static List<Category> getCategories() {
    return [
      Category("مساعدك الشخصي", "assets/images/ai.webp", Color(0xFF79C6E0)),
      Category("نصائح من الاخصائي", "assets/images/coolinfo.svg", Color(0xFF7FF5E2)),
      Category("فيديوهات اون لاين", "assets/images/25_Video Lession.svg", Color(0xFFABE1E0)),
      Category("التواصل مع الأخصائي", "assets/images/chat.svg", Color(0xFF79C6E0)),
      Category("التمارين الوارده", "assets/images/exercise.svg", Color(0xFFB7C4CF)),
      Category("المواعيد", "assets/images/calendar-svgrepo-com.svg", Color(0xFF41C8E1)),
    ];
  }
}
