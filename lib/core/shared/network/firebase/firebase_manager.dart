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

  static Stream<QuerySnapshot<ExerciseModel>> getExercises(DateTime date) {
    int startOfDay = DateUtils.dateOnly(date).millisecondsSinceEpoch;
    int endOfDay = startOfDay + Duration(days: 1).inMilliseconds;
    return getCollection()
        .orderBy('date')
        .where('date', isGreaterThanOrEqualTo: startOfDay)
        .where('date', isLessThan: endOfDay)
        .snapshots();
  }
}
