import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:healTalkpatient/index.dart';

class FirebaseApi extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  static final CollectionReference patientCollection =
      FirebaseFirestore.instance.collection('Patient');

  static final CollectionReference doctorCollection =
      FirebaseFirestore.instance.collection('Doctor');

  Patient _getdatafromSnapshot(DocumentSnapshot snapshot) {
    return Patient(
        pId: snapshot["pId"],
        firstName: snapshot['firstName'],
        lastName: snapshot["lastName"],
        age: snapshot["age"],
        email: snapshot["email"],
        gender: snapshot["gender"],
        picture: snapshot["picture"],
        isanonymous: snapshot["isanonymous"],
        createdDate: Utils.toDateTime(
          snapshot['lastMessageTime'],
        ));
  }

  Stream<Patient> get patient => patientCollection
      .doc(_auth.currentUser.uid)
      .snapshots()
      .map(_getdatafromSnapshot);

  Future uploadMessage(String uId, String ownerId, String message, String url,
      String name) async {
    final refMessages =
        FirebaseFirestore.instance.collection('chats/$ownerId/messages');

    final newMessage = Message(
      ownerId: ownerId,
      uId: uId,
      urlAvatar: url,
      name: name,
      message: message,
      createdAt: DateTime.now(),
    );
    await refMessages.add(newMessage.toJson());

    await doctorCollection
        .doc("dNxllvTQJ9P4YK1NgojD")
        .update({PatientField.lastMessageTime: DateTime.now()});
  }

  List<Message> _getmessagemap(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      // print(doc);
      return Message(
        ownerId: doc["ownerId"],
        uId: doc['uId'],
        urlAvatar: doc['urlAvatar'],
        name: doc['name'],
        message: doc['message'],
        createdAt: Utils.toDateTime(doc['createdAt']),
      );
    }).toList();
  }

  //  return Message(
  //     uId: snapshot['uId'],
  //     urlAvatar: snapshot['urlAvatar'],
  //     name: snapshot['name'],
  //     message: snapshot['message'],
  //     createdAt: Utils.toDateTime(snapshot['createdAt']),
  //   );

  Stream<List<Message>> getMessagesFromdoctor(String id) =>
      FirebaseFirestore.instance
          .collection('chats/$id/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .map(_getmessagemap);

  Stream<List<Message>> getMessagesfromuser() => FirebaseFirestore.instance
      .collection('chats/${_auth.currentUser.uid}/messages')
      .orderBy(MessageField.createdAt, descending: true)
      .snapshots()
      .map(_getmessagemap);
  // .transform(Utils.transformer(Message.fromJson));

//UpdateItem
  Future<void> updateItem(String img) async {
    DocumentReference documentReferencer =
        patientCollection.doc(_auth.currentUser.uid);

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

// add a new pateint
  Future addPatient(
      String userId,
      String firstName,
      String lastName,
      String email,
      String gender,
      bool isanonymous,
      String picture,
      int age) async {
    final newPatient = Patient(
      pId: userId,
      email: email,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      isanonymous: isanonymous,
      picture: picture,
      age: age,
      createdDate: DateTime.now(),
    );

    await patientCollection.doc(_auth.currentUser.uid).set(newPatient.toJson());
  }
}
