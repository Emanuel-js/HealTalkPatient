import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import '../index.dart';

class SideMenu extends StatefulWidget {
  // final padding = EdgeInsets.symmetric(horizontal: 10);
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Material(
      child: Drawer(
        child: Container(
          // padding: padding,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.only(top: 10),
                child: Logo(context),
              ),
              buildMenuItem(
                icon: Icons.person,
                text: "Profile",
                ontab: () {},
              ),
              buildMenuItem(
                  icon: Icons.history, text: "Session History", ontab: () {}),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3,
                    left: 10,
                    top: 30),
                child: LiteRollingSwitch(
                  //initial value
                  value: show,
                  textOn: 'Show Name',
                  textOff: 'Hide Name',
                  colorOn: colors.k_redColor,
                  colorOff: colors.k_primerygreenColor,
                  iconOn: Icons.done,
                  iconOff: Icons.remove_circle_outline,
                  textSize: 12.0,
                  onChanged: (bool state) {
                    //Use it to manage the different states

                    show = state;
                  },
                ),
              ),
              buildMenuItem(
                  icon: Icons.feedback,
                  text: "FeedBack",
                  ontab: () {
                    Navigator.push(
                        context, createRoute(FeedBackScreen(), context));
                  }),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.23,
                ),
                padding: EdgeInsets.all(20),
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
