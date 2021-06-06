import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';

class Intropages extends StatelessWidget {
  Intropages({this.con, this.title, this.disc, this.size, this.img});

  final size;
  final title;
  final disc;
  final img;
  final con;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            img,
            width: MediaQuery.of(con).size.width * 0.9,
            height: MediaQuery.of(con).size.height * 0.5,
          ),

          Container(
            margin: EdgeInsets.only(top: 50, bottom: 20),
            child: Text(
              title,
              style: header1(),
              textAlign: TextAlign.center,
            ),
          ),
          //discription

          Center(
            child: Container(
              // padding: EdgeInsets.all(10),
              child: Text(
                disc,
                style: body1(),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          //dote button
        ],
      ),
    );
  }
}
