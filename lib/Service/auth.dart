// import 'package:firebase_auth/firebase_auth.dart';
// import '../index.dart';

// class Auths {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String name = "";
//   Future registerUser(email, password, name) async {
//     try {
//       UserCredential userCredential = await _auth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       // final x = userCredential.additionalUserInfo.username;
//       // print(x);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void storeName(String newname) {
//     name = newname;
//   }
// }
