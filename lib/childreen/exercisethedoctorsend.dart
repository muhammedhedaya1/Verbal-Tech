import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_me_talk/childreen/ExerciseDetailsScreen.dart';

class ExercisesListScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.white, // Set the AppBar background color to white
        iconTheme: IconThemeData(color: Colors.blue), // Change the icon color
        title: Text(
          'التمارين',
          style: TextStyle(color: Colors.blue, fontSize: 18.sp), // Change the title color
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_sweep_rounded, color: Colors.blue),
            onPressed: () async {
              bool confirm = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('تأكيد', style: TextStyle(fontSize: 18.sp)),
                  content: Text('هل أنت متأكد أنك تريد مسح كل التمارين؟', style: TextStyle(fontSize: 16.sp)),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('لا', style: TextStyle(fontSize: 14.sp)),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('نعم', style: TextStyle(fontSize: 14.sp)),
                    ),
                  ],
                ),
              );

              if (confirm) {
                await _deleteAllExercises();
              }
            },
          ),
        ],
      ),
      backgroundColor: Colors.white, // Set the Scaffold background color to white
      body: StreamBuilder(
        stream: _firestore.collection('exercises').orderBy('number').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var exercises = snapshot.data!.docs;

          return ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              var exercise = exercises[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    (exercise['number']).toString(),
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ),
                title: Text(
                  'تمرين رقم ${exercise['number']}',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 16.sp,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExerciseDetailsScreen(exercise.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _deleteAllExercises() async {
    var collection = _firestore.collection('exercises');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}
