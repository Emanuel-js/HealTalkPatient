import 'package:flutter/material.dart';

void main() {
  runApp(HealTalk());
}

class HealTalk extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("HealTalk"),
        ),
        body: Center(
          child: Text("my code"),
        ),
      ),
    );
  }
}
