import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';

class Button1 extends StatelessWidget {
  final colors = Appcolor();
  Button1({this.color, this.text, this.onpress});
  final color;
  final text;
  final onpress;

  ///
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: size.width / 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.2)),
      ),
      onPressed: () {},
      color: color,
      child: Text(
        text,
        style: TextStyle(color: colors.k_white),
      ),
    );
  }
}

class OutlineButton1 extends StatelessWidget {
  OutlineButton1({this.color, this.text, this.onpress});
  final color;
  final text;
  final onpress;

  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final size = MediaQuery.of(context).size;
    return OutlineButton(
      onPressed: () {
        onpress();
      },
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: size.width / 10),
      child: Text(
        text,
        style: TextStyle(
          color: colors.k_primerygreenColor,
          fontWeight: FontWeight.w900,
        ),
      ),
      borderSide: BorderSide(color: colors.k_primerygreenColor, width: 3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.2)),
      ),
    );
  }
}
