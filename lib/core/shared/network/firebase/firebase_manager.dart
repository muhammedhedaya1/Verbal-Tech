import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:help_me_talk/data/model/exercise_model/exercise_model.dart';

class FirebaseManager {
  static CollectionReference<ExerciseModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('Exercise')
        .withConverter<ExerciseModel>(
      fromFirestore: (snapshot, _) => ExerciseModel.fromjson(snapshot.data()!),
      toFirestore: (value, _) => value.toJson(),
    );
  }

  static Future<void> addExercise(ExerciseModel exercise) {
    CollectionReference collection = getCollection();
    var doc = collection.doc();
    exercise.id = doc.id;
    return doc.set(exercise);
  }

  static Stream<QuerySnapshot<ExerciseModel>> getExercise(DateTime date) {
    return getCollection()
        .orderBy('date', descending: true)
        .where('date',
        isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteExercise(String taskId) {
    return getCollection().doc(taskId).delete();
  }

  static void updateExercise(ExerciseModel model) {
    getCollection().doc(model.id).update(model.toJson());
  }
}