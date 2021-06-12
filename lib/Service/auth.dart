// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../index.dart';

// class Authentication extends ChangeNotifier {
//   // intialize the firbase auth
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   DatabaseReference userRef =
//       FirebaseDatabase.instance.reference().child("users");

//   String email;
//   String name;
// // get the email
//   String get getEmail {
//     return email;
//   }

//   String get getName {
//     return name;
//   }

//   void registerNewUser(
//       String email, String password, BuildContext context, name) async {
//     try {
//       final User newUser = (await _firebaseAuth
//               .createUserWithEmailAndPassword(email: email, password: password)
//               .catchError((err) {
//         DisplayMsg().displayMessage("Error ${err.toString()}", context);
//       }))
//           .user;
//       if (newUser != null) {
//         Map userDataMap = {
//           "fullName": name.trim(),
//           "email": email.trim(),
//         };
//         userRef.child(newUser.uid).set(userDataMap);
//         print("congrat created new account!");
//         Navigator.push(context, createRoute(VerificationScreen()));
//       } else {}
//     } catch (e) {
//       DisplayMsg().displayMessage(e.toString(), context);
//     }
//   }

//   Future signinPatient(String email, String password, String name) async {
//     UserCredential userCredential = await _firebaseAuth
//         .signInWithEmailAndPassword(email: email, password: password);
//     User patient = userCredential.user;
//     assert(patient.uid != null);
//     email = patient.email;
//     notifyListeners();
//     return patient.uid == null ? null : patient.uid;
//   }
// }
