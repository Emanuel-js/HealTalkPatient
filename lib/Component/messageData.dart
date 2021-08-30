import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:healTalkpatient/index.dart';

class CahtList extends StatefulWidget {
  final snapshot;

  CahtList({this.snapshot});

  @override
  _CahtListState createState() => _CahtListState();
}

class _CahtListState extends State<CahtList> {
  final colors = Appcolor();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.snapshot.length,
      itemBuilder: (context, index) {
        return chatSelect(context, widget.snapshot[index]);
      },
    );
  }

  chatSelect(context, chat) {
    print(_auth.currentUser.uid);
    print(chat["senderID"]);
    if (_auth.currentUser.uid == chat["senderID"]) {
      return senderCaht(context, chat);
    } else {
      return receiverChat(context, chat);
    }
  }

  receiverChat(context, chat) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Text(chat["date"]),
            ),
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: colors.k_primerygreenColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(0.0),
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                ),
                padding: EdgeInsets.all(20),
                child: Text(
                  chat["message"],
                  style: body2(color: colors.k_white),
                ),
              ),
            ),
          ],
        ));
  }

  senderCaht(context, chat) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: colors.k_white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Text(
                  chat["message"],
                  style: body2(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Flexible(
                flex: 0,
                child: Text(chat["date"]),
              ),
            )
          ],
        ));
  }
}
