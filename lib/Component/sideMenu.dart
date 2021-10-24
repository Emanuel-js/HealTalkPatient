import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healTalkpatient/Screen/Profile/profileScreen.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import '../index.dart';

class SideMenu extends StatefulWidget {
  // final padding = EdgeInsets.symmetric(horizontal: 10);
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isSwitched;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        // textValue = 'Switch Button is ON';
      });
    } else {
      setState(() {
        isSwitched = false;
        //  textValue = 'Switch Button is OFF';
      });
      // print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   if (isanonymous != null) isSwitched = isanonymous.isanonymous;
    // });
    void toggleSwitch(bool value) {
      if (isSwitched == false) {
        setState(() {
          isSwitched = true;
          FirebaseApi().updateName(true);
        });
      } else {
        setState(() {
          isSwitched = false;
          FirebaseApi().updateName(false);
        });
      }
    }

    final colors = Appcolor();
    return Material(
      child: Drawer(
        child: Container(
          // padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(top: 10),
                    child: Logo(context),
                  ),
                  buildMenuItem(
                    icon: Icons.person,
                    text: "Profile",
                    ontab: () {
                      Navigator.push(context, createRoute(ProfileScreen()));
                    },
                  ),
                  // buildMenuItem(
                  //     icon: Icons.history,
                  //     text: "Session History",
                  //     ontab: () {}),
                  Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.3,
                        left: 10,
                        top: 30),
                    child: Transform.scale(
                        scale: 2,
                        child: Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.yellow,
                          inactiveThumbColor: Colors.redAccent,
                          inactiveTrackColor: Colors.orange,
                        )),
                  ),
                  buildMenuItem(
                      icon: Icons.feedback,
                      text: "FeedBack",
                      ontab: () {
                        Navigator.push(context, createRoute(FeedBackScreen()));
                      }),
                ],
              ),
              Button1(
                text: "Logout",
                color: colors.k_redColor,
                onpress: () {
                  // log out
                  AuthControlle().logout().then((value) =>
                      Navigator.pushReplacement(
                          context, createRoute(FirstScreen())));
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "version 1.0",
                            style: body1(),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("about");
                            },
                            child: Text(
                              "About",
                              style: body1(),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({String text, IconData icon, Function ontab}) {
    final colors = Appcolor();
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: ListTile(
        hoverColor: colors.k_primerygreenColor,
        leading: Icon(
          icon,
          color: colors.k_gray2,
        ),
        title: Text(
          text,
          style: header2(color: colors.k_purplecolor),
        ),
        onTap: () {
          ontab();
        },
      ),
    );
  }
}
