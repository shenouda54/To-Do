import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';

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

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        //database (Map)
        return UserModel.fromJson(snapshot.data()!); //return model
      },
      toFirestore: (user, _) {
        //model
        return user.toJson(); //return (Map) and go firebase
      },
    );
  }

  static Future<void> addUser(UserModel userModel) {
    var collection = getUsersCollection();
    var docRef = collection.doc(userModel.id);
    return docRef.set(userModel);
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
        .where("userID", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .where("date",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return gettasksCollection().doc(id).delete();
  }

  static Future<void> updateTask(TaskModel model) {
    return gettasksCollection().doc(model.id).update(model.toJson());
  }

  static Future<UserModel?> readUser() async {
    DocumentSnapshot<UserModel> docRef = await getUsersCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return docRef.data();

  }

  static loginUser(String emailAddress, String password,
      {required Function onSuccess, required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      onSuccess(credential.user?.displayName ?? "");
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }

  static createAccountAuth(
    String emailAddress,
    String password, {
    required Function onSuccess,
    required Function onError,
    required String userName,
    required String phone,
    required int age,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await credential.user?.sendEmailVerification();
      UserModel userModel = UserModel(
        id: credential.user!.uid,
        email: emailAddress,
        userName: userName,
        age: age,
        phone: phone,
      );
      addUser(userModel);

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }
}
