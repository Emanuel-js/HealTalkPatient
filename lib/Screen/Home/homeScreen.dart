import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:healTalkpatient/Screen/Profile/profileScreen.dart';
import 'package:provider/provider.dart';

import '../../index.dart';

class HomeScreen1 extends StatefulWidget {
  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final colors = Appcolor();
  bool hasnotification = true;
  int page = 0;
  List<Widget> listWidgets = [MainScreen(), MessageScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Request>(context);
    if (info != null) {
      hasnotification = info.isaccepted;
    }
    return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          backgroundColor: colors.k_bkColor,
          elevation: 0,
          //todo landing
          leading: LeadingNave(),

          //todo title
          title: Text('Meet your matches', style: header2()),
          centerTitle: true,
          //Todo notification
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, createRoute(NotificationScreen()));
              },
              icon: hasnotification
                  ? Icon(
                      Icons.notifications_on,
                      size: 30,
                      color: colors.k_redColor,
                    )
                  : Icon(
                      Icons.notifications,
                      size: 30,
                      color: colors.k_seconderypurpleColor,
                    ),
            ),
          ],
        ),
        body: listWidgets[page],
        bottomNavigationBar: ConvexAppBar(
          color: colors.k_primerygreenColor,
          backgroundColor: colors.k_white,
          activeColor: colors.k_primerygreenColor,

          // style: TabStyle.titled,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.message, title: 'Chat'),
            TabItem(icon: Icons.schedule, title: 'Profile'),
          ],
          initialActiveIndex: 0, //optional, default as 0
          onTap: onItemTapped,
        ));
  }

  void onItemTapped(int index) {
    setState(() {
      page = index;
    });
  }
}
