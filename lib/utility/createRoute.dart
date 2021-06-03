import 'package:flutter/material.dart';

Route createRoute(Widget screen, context) {
  return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 700),
      transitionsBuilder: (context, animation, animationTime, child) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
        return ScaleTransition(
            scale: animation, alignment: Alignment.center, child: child);
      },
      pageBuilder: (context, animation, animationTime) {
        return screen;
      });
}
