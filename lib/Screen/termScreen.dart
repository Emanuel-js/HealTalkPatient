import 'package:flutter/material.dart';
import '../index.dart';

class TermScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
      appBar: backAppBar(context: context, color: colors.k_bkColor),
      body: SafeArea(
        child: Column(
          children: [
            //title
            Container(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.4),
              child: Text(
                "Terms and  ",
                style: header1(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.4),
              child: Text(
                "condtions",
                style: header1(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(""),
            )
          ],
        ),
      ),
    );
  }
}
