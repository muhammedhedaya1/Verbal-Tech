import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_me_talk/childreen/RecordResponseScreen.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final String exerciseId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ExerciseDetailsScreen(this.exerciseId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل التمرين'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _firestore.collection('exercises').doc(exerciseId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var exercise = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('عنوان: ${exercise['title']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('وصف: ${exercise['description']}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                exercise['imageUrl'] != null
                    ? Image.network(exercise['imageUrl'])
                    : SizedBox.shrink(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecordResponseScreen(exerciseId),
                      ),
                    );
                  },
                  child: Text('تسجيل رد'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
