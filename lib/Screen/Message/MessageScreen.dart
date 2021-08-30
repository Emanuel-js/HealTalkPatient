import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatelessWidget {
  final colors = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: colors.k_primerygreenColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(context, createRoute(ChatScreen()));
          },
          leading: Hero(
            tag: "pro",
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('asset/img/pic.jpg'),
            ),
          ),
          title: Text(
            "Amanuel Awol",
            style: header2(color: colors.k_white),
          ),
          subtitle: Text(
            "bla bal",
            style: body2(color: colors.k_white),
          ),
        ),
      ),
    );
  }
}

// chat aria
class ChatScreen extends StatelessWidget {
  final colors = Appcolor();
  final messge = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colors.k_primerygreenColor,
          leading: Container(
            child: IconBtn(
              color: colors.k_seconderypurpleColor,
              icon: Icons.arrow_back_ios,
              onpress: () {
                Navigator.pop(context);
              },
            ),
          ),
          elevation: 0,
          actions: [
            Container(
              child: Hero(
                tag: "pro",
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('asset/img/pic.jpg'),
                ),
              ),
            ),
            Container(
                child: IconBtn(
              icon: Icons.phone,
            )),
            PopupMenuButton<Menus>(
              onSelected: (Menus result) {
                // setState(() {
                //   _selection = result;
                // });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menus>>[
                PopupMenuItem<Menus>(
                  value: Menus.schedule,
                  child: Container(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.push(context, createRoute(MainScreen())),
                      child: Text('Schedule'),
                    ),
                  ),
                ),
                PopupMenuItem<Menus>(
                  value: Menus.detail,
                  child: Text('Show Profile'),
                ),
                PopupMenuItem<Menus>(
                  value: Menus.end_sessions,
                  child: Text('End Sessions'),
                ),
                PopupMenuItem<Menus>(
                  value: Menus.report,
                  child: Text('Report'),
                ),
              ],
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: MessageControler()
              .messageCollection
              .doc()
              .collection("message")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final chat = snapshot.data.docs;
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 65),
                    child: CahtList(snapshot: chat),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: messge,
                        decoration: InputDecoration(
                          fillColor: colors.k_gray,
                          suffixIcon: IconBtn(
                            onpress: () {
                              sendMessage(context);
                            },
                            icon: Icons.send,
                            color: colors.k_seconderypurpleColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),
                          ),
                          hintText: 'Send message..',
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Text("laoding.....");
          },
        ));
  }

  sendMessage(context) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    final format = DateFormat.jm();
    String date = format.format(dt);

    if (messge.text.isEmpty) {
      DisplayMsg()
          .displayMessage(msg: "please insert message", context: context);
    }
    MessageControler().sendMessages(messge.text.trim(), "", date);
    messge.clear();
    // MessageControler().messageStream();
  }

//   void selectactions(ch) {
//     BuildContext context;
//     if (ch == menu.schedule) {
//     } else if (ch == menu.detail) {
//       Navigator.push(context, createRoute(DetailScreen()));
//     }
//   }
}

enum Menus { schedule, detail, end_sessions, report }

// class menu {
//   static const String schedule = "Schedule";
//   static const String detail = "Show Profile";
//   static const String end_sessions = "End sessions ";
//   static const String report = "Report";

//   static List<String> popupmenu = [schedule, detail, end_sessions, report];
// }
