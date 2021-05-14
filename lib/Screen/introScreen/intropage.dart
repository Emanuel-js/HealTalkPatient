import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          // image
          SizedBox(
            height: 10,
          ),
          Center(child: Image.asset(img)),
          //title
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              title,
              style: Theme.of(con).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ),
          //discription
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Text(
            disc,
            style: Theme.of(con).textTheme.headline6,
          )),
          //dote button
        ],
      ),
    );
  }
}
