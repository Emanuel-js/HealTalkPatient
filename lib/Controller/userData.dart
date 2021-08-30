import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:healTalkpatient/main.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'package:path/path.dart';
import '../index.dart';

class UserData {
  UserData();

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  final _auth = FirebaseAuth.instance;

  Patient _getdatafromSnapshot(DocumentSnapshot value) {
    return Patient(
        firstName: value['FirstName'],
        lastName: value["LastName"],
        age: value["age"] ?? 0,
        email: value["email"] ?? "",
        gender: value["gender"] ?? "",
        picture: value["picture"] ?? "",
        isanonymous: value["isanonymous"] ?? "");
  }

  Future<void> addUser(String userId, String firstName, String lastName,
      String email, String gender, bool isanonymous, String picture, int age) {
    // Call the user's CollectionReference to add a new user
    userCollection
        .doc(_auth.currentUser.uid)
        .set({
          "uid": userId,
          "FirstName": firstName,
          "LastName": lastName,
          "email": email,
          "gender": gender,
          "isanonymous": isanonymous,
          "picture": picture,
          "age": age,
        })
        .then((value) => print("data is added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateItem(String img) async {
    DocumentReference documentReferencer =
        userCollection.doc(_auth.currentUser.uid);

    Map<String, dynamic> data = <String, dynamic>{
      "picture": img,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => DisplayMsg()
            .displayMessage(msg: "You Profile is Updated", context: context))
        .catchError((e) => DisplayMsg()
            .displayMessage(msg: "Please try Again", context: context));
  }

  Stream<Patient> get patient {
    return userCollection
        .doc(_auth.currentUser.uid)
        .snapshots()
        .map(_getdatafromSnapshot);
  }

  Future uploadFile(_file) async {
    String fileName = basename(_file.path);
    File file = File(_file.path);
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/$fileName')
          .putFile(file);
      String url = await downloadFile(fileName);
      updateItem(url);
    } on firebase_core.FirebaseException catch (e) {
      print(e.message);
      // e.g, e.code == 'canceled'
    }
  }

  Future<String> downloadFile(filePath) async {
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // File downloadToFile = File('${appDocDir.path}/download-logo.png');
    String url;
    try {
      url = await firebase_storage.FirebaseStorage.instance
          .ref('uploads/$filePath')
          .getDownloadURL();
    } on firebase_core.FirebaseException catch (e) {
      print(e.code);
    }
    return url;
  }
}
