import 'package:flutter/material.dart';
import './../index.dart';

Widget backAppBar({BuildContext context, Color color, isside = false}) {
  final colors = Appcolor();
  return AppBar(
    backgroundColor: color,
    elevation: 0,
    leading: IconBtn(
      color: colors.k_primerygreenColor,
      icon: Icons.arrow_back_ios,
      onpress: () {
        isside
            ? Navigator.push(context, createRoute(MainScreen(), context))
            : Navigator.pop(context);
      },
    ),
  );
}
