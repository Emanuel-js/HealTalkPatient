import 'package:flutter/material.dart';

Route createRoute(Widget screen) {
  return PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
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
