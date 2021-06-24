import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PIC = "pic";

  String id;
  String name;
  String email;
  String pic;
  UserModel({this.id, this.name, this.email, this.pic});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    // name = snapshot.data()[NAME];
    // email = snapshot.data()[EMAIL];
    // id = snapshot.data()[ID];
    // pic = snapshot.data()[PIC] ?? [];
  }
}
