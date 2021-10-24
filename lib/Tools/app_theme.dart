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
    );
  }
}
