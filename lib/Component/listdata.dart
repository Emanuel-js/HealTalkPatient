import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../index.dart';
import 'dart:math';

class Listdetail extends StatefulWidget {
  Listdetail({this.data});
  Doctor data;

  @override
  _ListdetailState createState() => _ListdetailState();
}

class _ListdetailState extends State<Listdetail> {
  final colors = Appcolor();

  @override
  Widget build(BuildContext context) {
    List bkcolor = [
      Color(0xFF72BF94),
      Color(0xFF797373),
      Color(0xFF7C7FEA),
      Color(0xFFE4E7F6),
    ];

    Random rnd = new Random();
    int r = rnd.nextInt(bkcolor.length);
    final bk = bkcolor[r];
    String year = DateFormat.yMMMd().add_jm().format(widget.data?.createdDate);

    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: bk, borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(Icons.work),
              title: Text(
                "Experience",
                style: body1(color: r == 3 ? Colors.black : Colors.white),
              ),
              subtitle: Text(
                "${expe(widget.data?.expriance)}",
                style: body2(color: r == 3 ? Colors.purple : Colors.white),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: bk, borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(Icons.favorite, color: Colors.deepOrangeAccent),
              title: Text(
                "Focus Area",
                style: body1(color: r == 3 ? Colors.black : Colors.white),
              ),
              subtitle: Text(
                "${widget.data?.focus}",
                style: body2(color: r == 3 ? Colors.purple : Colors.white),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: bk, borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading:
                  Icon(Icons.calendar_today, color: Colors.lightGreenAccent),
              title: Text(
                "Joind HealTalk",
                style: body1(color: r == 3 ? Colors.black : Colors.white),
              ),
              subtitle: Text(
                "$year",
                style: body2(color: r == 3 ? Colors.purple : Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  String expe(x) {
    if (x == "1")
      return "1 - 5  years in practice";
    else if (x == "2")
      return "6 - 10  years in practice";
    else if (x == "3") return "more than 15 years in practice";
    return "";
  }
}
