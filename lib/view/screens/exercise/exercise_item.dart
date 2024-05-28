import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:help_me_talk/core/shared/network/firebase/firebase_manager.dart';
import 'package:help_me_talk/data/model/exercise_model/exercise_model.dart';


class ExerciseItem extends StatelessWidget {
  ExerciseModel task;

  ExerciseItem(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.transparent),
      ),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              FirebaseManager.deleteExercise(task.id);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'حذف',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.blue)),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title ?? '+++',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    task.description ?? '++++',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  task.isDone = true;
                  FirebaseManager.updateExercise(task);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                      color: task.isDone ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: task.isDone
                      ? Text(
                    "تم!",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                      : Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}