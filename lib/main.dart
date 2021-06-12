import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'index.dart';

int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  initScreen = await pref.getInt('initScreen');
  await pref.setInt('initScreen', 1);

  runApp(HealTalk());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("users");

class HealTalk extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HealTalkState createState() => _HealTalkState();
}

class _HealTalkState extends State<HealTalk> {
  final auth = FirebaseAuth.instance;
  User users;
  @override
  void initState() {
    User users = auth.currentUser;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool islogin = false;
    return MaterialApp(
        theme: AppTheme.define(),
        debugShowCheckedModeBanner: false,
        home: initScreen == 0 || initScreen == null
            ? IntroScreen1()
            : users == null
                ? FirstScreen()
                : HomeScreen1());
  }
}
