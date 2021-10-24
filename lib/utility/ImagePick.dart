// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class Uploader extends StatefulWidget {
//   final File file;
//   const Uploader({Key key, this.file}) : super(key: key);

//   @override
//   _UploaderState createState() => _UploaderState();
// }

// class _UploaderState extends State<Uploader> {
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instanceFor(
//           bucket: 'gs://heal-talk.appspot.com');
//   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
//       .ref('images/defaultProfile.png');
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
