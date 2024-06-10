import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_me_talk/view/home/categories/CategoryWidget.dart';
import 'package:help_me_talk/view/home/categories/category.dart';
import 'package:help_me_talk/view/home/tabs/chat.dart';
import 'package:help_me_talk/view/home/tabs/process.dart';
import 'package:help_me_talk/view/screens/model_screen/ModelScreen.dart';
import 'package:help_me_talk/view/screens/online_videos/videos.dart';
import 'package:help_me_talk/view/home/tips_screen.dart';
import 'package:help_me_talk/childreen/exercisethedoctorsend.dart';

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
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            SizedBox(height: 20.h), // Add space above the text
            Center(
              child: Text(
                "🙏 نحن هنا لمساعدتك",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF41C8E1),
                ),
              ),
            ),
            SizedBox(height: 30.h), // Add space below the text
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24.w,
                crossAxisSpacing: 20.w,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  if (categories[index].title == "نصائح من الاخصائي") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TipsScreen(),
                      ),
                    );
                  } else if (categories[index].title == "التواصل مع الأخصائي") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParentChatScreen(),
                      ),
                    );
                  } else if (categories[index].title == "التمارين الوارده") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExercisesListScreen(),
                      ),
                    );
                  } else if (categories[index].title == "المواعيد") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TasksTab(),
                      ),
                    );
                  } else if (categories[index].title == "فيديوهات اون لاين") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoGridView(),
                      ),
                    );
                  } else if (categories[index].title == "مساعدك الشخصي") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>VoiceRecognitionScreen(),
                      ),
                    );
                  } else {
                    widget.onCategoryClick(categories[index]);
                  }
                },
                child: CategoryItem(categories[index], index),
              ),
              itemCount: categories.length,
            ),
          ],
        ),
      ),
    );
  }
}
