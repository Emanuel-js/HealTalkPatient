import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';

class AppTheme {
  static ThemeData define() {
    final colors = Appcolor();
    return ThemeData(
      fontFamily: "lato",
      primaryColor: colors.k_primerygreenColor,
      scaffoldBackgroundColor: colors.k_bkColor,
      accentColor: colors.k_seconderypurpleColor,
      textTheme: TextTheme(
        headline4: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.w100,
          color: Colors.black45,
        ),
      ),
    );
  }
}
