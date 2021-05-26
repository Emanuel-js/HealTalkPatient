import 'package:flutter/material.dart';
import '../index.dart';

class TermScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: IconBtn(
                color: colors.k_primerygreenColor,
                icon: Icons.arrow_back,
                onpress: () {
                  Navigator.pop(context);
                },
              ),
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.8),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
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
              child: Text(
                  "ndmndnmndmsndmnsmdnmsndmndnmsdnmsnsdmnsmdnmsndsdmnmsndmsdnmnsdmnsmdnmsndmnsmdnsmdnmssdmsndmnsdnmdsnmsndmnsmdnmsndmnsdmnsmdnmsndmsndmnsdmnsmdnmsndmsndmnsdmnmsdnmsnmsndnsmdnmndsmndmnsmadnansjfonokjfksjdhfjhjdfhjkdshfjhdsjfhowehrihjfdhfjhuh"),
            )
          ],
        ),
      ),
    );
  }
}
