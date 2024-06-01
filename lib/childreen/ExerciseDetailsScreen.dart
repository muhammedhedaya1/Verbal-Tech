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
        iconTheme: IconThemeData(
          color: Colors.blue, // Change the back arrow color
        ),
        title: Center(
          child: Text(
            'تفاصيل التمرين',
            style: TextStyle(color: Colors.blue), // Change the title color
          ),
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'التمرين: ${exercise['title']}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'المطلوب: ${exercise['description']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                ),
                SizedBox(height: 20),
                exercise['imageUrl'] != null
                    ? Center(
                  child: ClipOval(
                    child: Image.network(
                      exercise['imageUrl'],
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : SizedBox.shrink(),
                SizedBox(height: 20),
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
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
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
                              width: 20,
                            ),
                            Text(
                              "يمكنك تسجيل ردك الان",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
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