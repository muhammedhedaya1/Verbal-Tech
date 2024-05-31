import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_me_talk/view/screens/exerciseList/ExerciseDetailsScreen.dart';

class ExercisesListScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
        title: Center(child: Text('التمارين',style: TextStyle(color: Colors.blue),)),
        actions: [
          IconButton(
            icon: Icon(Icons.delete,color: Colors.blue,),
            onPressed: () async {
              bool confirm = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('تأكيد'),
                  content: Text('هل أنت متأكد أنك تريد مسح كل التمارين؟'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('لا'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('نعم'),
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
      body: StreamBuilder(
        stream: _firestore.collection('exercises').snapshots(),
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
                  child: Text((index + 1).toString()),
                ),
                title: Text('التمرين ${index + 1}'),
                trailing: Icon(Icons.arrow_forward_ios),
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
