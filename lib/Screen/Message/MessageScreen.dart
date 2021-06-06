import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
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
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colors.k_bkColor,
          leading: Container(
            child: IconBtn(
              color: colors.k_primerygreenColor,
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
        body: Container(child: Text("wow")));
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
