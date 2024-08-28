import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/task_model.dart';

class FirebaseFunction {
  static CollectionReference<TaskModel> gettasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        //database (Map)
        return TaskModel.fromJson(snapshot.data()!); //return model
      },
      toFirestore: (taskModel, _) {
        //model
        return taskModel.toJson(); //return (Map) and go firebase
      },
    );
  }

  static Future<void> addTask(TaskModel model) async {
    var collection = gettasksCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    var collection = gettasksCollection();
    return collection
        .where("data",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }
}


