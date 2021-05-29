import 'package:flutter/material.dart';
import './../index.dart';

Widget LeadingNave() {
  final colors = Appcolor();
  return Builder(builder: (BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.menu,
        color: colors.k_primerygreenColor,
        size: 35,
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    );
  });
}
