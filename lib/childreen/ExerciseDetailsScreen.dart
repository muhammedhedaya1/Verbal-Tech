import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_me_talk/childreen/RecordResponseScreen.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final String exerciseId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ExerciseDetailsScreen(this.exerciseId);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      appBar: AppBar(centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.blue, // Change the back arrow color
        ),
        title: Text(
          'تفاصيل التمرين',
          style: TextStyle(color: Colors.blue), // Change the title color
        ),
        backgroundColor: Colors.white, // Set the AppBar background color to white
      ),
      backgroundColor: Colors.white, // Set the Scaffold background color to white
      body: FutureBuilder<DocumentSnapshot>(
        future: _firestore.collection('exercises').doc(exerciseId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var exercise = snapshot.data!;
          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'التمرين: ${exercise['title']}',
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    'المطلوب: ${exercise['description']}',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                ),
                SizedBox(height: 20.h),
                exercise['imageUrl'] != null
                    ? Center(
                  child: ClipOval(
                    child: Image.network(
                      exercise['imageUrl'],
                      width: 150.w,
                      height: 150.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : SizedBox.shrink(),
                SizedBox(height: 20.h),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecordResponseScreen(exerciseId),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.keyboard_voice_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "يمكنك التسجيل الان",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
