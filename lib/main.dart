import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'index.dart';

int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  initScreen = pref.getInt('initScreen');
  await pref.setInt('initScreen', 1);

  runApp(HealTalk());
}

final auth = FirebaseAuth.instance;
final userCur = auth.currentUser;

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("Users");

class HealTalk extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.define(),
        debugShowCheckedModeBanner: false,
        home: pageControll());
  }

  Widget pageControll() {
    if (initScreen == 0 || initScreen == null) {
      return IntroScreen1();
    }
    if (userCur?.emailVerified == true && userCur != null) {
      userCur.reload();
      return HomeScreen1();
    } else {
      return FirstScreen();
    }
  }
}
