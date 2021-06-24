import 'package:flutter/material.dart';
import '../../index.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
      appBar: backAppBar(context: context, color: colors.k_bkColor),
      body: SafeArea(
        child: Container(
          child: Text("Notification "),
        ),
      ),
    );
  }
}
