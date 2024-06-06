import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:help_me_talk/core/shared/network/firebase/firebase_manager.dart';
import 'package:help_me_talk/data/model/exercise_model/exercise_model.dart';

class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Center(
          child: Text(
            'مواعيد التمارين الخاصة بالطفل',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.redAccent[100],
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => true,
            locale: 'ar',
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<ExerciseModel>>(
              stream: FirebaseManager.getExercises(selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("حدث خطأ ما"));
                }
                List<ExerciseModel> tasks = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0), // Add space between items
                      child: ExerciseItem(tasks[index]),
                    );
                  },
                  itemCount: tasks.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseItem extends StatelessWidget {
  final ExerciseModel exercise;

  ExerciseItem(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(exercise.id), // تأكد من وجود معرف فريد لكل عنصر
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _deleteExercise(context, exercise),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'حذف',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          title: Text(
            exercise.title,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            exercise.description,
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }

  void _deleteExercise(BuildContext context, ExerciseModel exercise) async {
    // حذف التمرين من قاعدة البيانات
    await FirebaseManager.getCollection().doc(exercise.id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم حذف التمرين')),
    );
  }
}
