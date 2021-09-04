import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';

showAlertDialog(BuildContext context, String title, String disc, String id,
    String bt1, Function fun) {
  // set up the buttons
  final colors = Appcolor();
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: colors.k_primerygreenColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title: Text(title,
        style: header2(
          color: colors.k_white,
        )),
    content: Text(disc,
        style: body1(
          color: colors.k_white,
        )),
    actions: [
      Button1(
        text: "Cancel",
        color: Colors.red,
        onpress: () {
          Navigator.pop(context);
        },
      ),
      Button1(
        color: Colors.blueGrey,
        text: "Continue",
        onpress: () {
          fun(); // print("ppp");
        },
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
