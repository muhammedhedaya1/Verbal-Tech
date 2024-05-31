import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_me_talk/view/screens/exerciseList/ExerciseDetailsScreen.dart';

class ExercisesListScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التمارين'),
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
                title: Text(exercise['title']),
                subtitle: Text(exercise['description']),
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
}
