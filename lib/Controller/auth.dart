import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../index.dart';

class AuthControlle {
  final _auth = FirebaseAuth.instance;
  User u;
  Future regsiter<bool>(String firstName, String lastName, String email,
      String password, String gender, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DisplayMsg()
            .displayMessage('The password provided is too weak.', context);
        return false;
      } else if (e.code == 'email-already-in-use') {
        DisplayMsg().displayMessage(
            'The account already exists for that email.', context);
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  void emailVar(BuildContext context) async {
    User u = FirebaseAuth.instance.currentUser;

    if (u.emailVerified) {
      Navigator.pushReplacement(context, createRoute(HomeScreen1()));
    }
  }

  Future login<bool>(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DisplayMsg().displayMessage('No user found for that email.', context);
        return false;
      } else if (e.code == 'wrong-password') {
        DisplayMsg()
            .displayMessage('Wrong password provided for that user.', context);
        return false;
      }
    }
  }

  Future logout<User>() async {
    _auth.signOut();
    print("user is loged out");
  }
}
