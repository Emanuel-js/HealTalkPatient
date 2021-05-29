import 'package:flutter/material.dart';
import '../index.dart';
import 'dart:math';

class Listdetail extends StatelessWidget {
  Listdetail({this.title, this.disc, this.icon, this.color});
  final title;
  final disc;
  final icon;
  final color;
  final colors = Appcolor();

  @override
  Widget build(BuildContext context) {
    List bkcolor = [
      Color(0xFF72BF44),
      Color(0xFF797373),
      Color(0xFF7C7FEA),
      Color(0xFFE4E7F6),
    ];

    Random rnd = new Random();
    int r = rnd.nextInt(bkcolor.length);
    final bk = bkcolor[r];

    return Container(
      decoration: BoxDecoration(
          color: bk, borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Icon(
          icon,
          color: r == 3 ? Colors.blue : color,
        ),
        title: Text(
          title,
          style: body1(color: r == 3 ? Colors.black : Colors.white),
        ),
        subtitle: Text(
          disc,
          style: body2(color: r == 3 ? Colors.purple : Colors.white),
        ),
      ),
    );
  }
}
