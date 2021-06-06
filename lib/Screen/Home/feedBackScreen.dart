import 'package:flutter/material.dart';
import '../../index.dart';

class FeedBackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final commentControler = TextEditingController();

    return Scaffold(
      appBar: backAppBar(context: context, color: colors.k_bkColor),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "asset/img/Humaaans Graphs.png",
              width: MediaQuery.of(context).size.height * 0.35,
            ),
            // Text(
            //   "hffff",
            //   style: header1(),
            // ),
            Center(
              child: BuildText(
                controler: commentControler,
                ispassword: false,
                iconSufix: Icons.safety_divider,
                isvisble: false,
                lebel: "comment",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Button1(
                  text: "Send",
                  color: colors.k_seconderypurpleColor,
                  onpress: () {
                    _showDialog(context);
                  }),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.deepPurpleAccent,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: GestureDetector(
              onTap: () {
                Navigator.pop(context, 'No');
              },
              child: Container(
                height: 200,
                child: Column(children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("asset/img/check-circle.gif"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Thank you For your FeedBack",
                    style: body1(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ),
            ));
      },
    );
  }
}
