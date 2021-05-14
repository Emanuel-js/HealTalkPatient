import 'package:flutter/material.dart';
import 'package:healTalkpatient/Color/app_theme.dart';
import 'package:healTalkpatient/Screen/introScreen/introScreen.dart';
import 'Screen/loginScreen.dart';

void main() {
  runApp(HealTalk());
}

class HealTalk extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool islogin = false;
    return MaterialApp(
      theme: AppTheme.define(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: islogin ? LoginScreen() : IntroScreen1()),
    );
  }
}
