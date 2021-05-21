import "package:flutter/material.dart";
import '../../index.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Todo title
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Your #1 Choice",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
          //Todo logo
          Center(
            child: Image.asset("asset/img/logo.png"),
          ),
          //Todo button
          Row(
            children: [
              //button 1

              //button 2
            ],
          )
        ],
      )),
    );
  }
}
