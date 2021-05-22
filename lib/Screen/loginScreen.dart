import 'package:flutter/material.dart';
import "../index.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //todo back arrow

            Container(
              child: IconBtn(
                color: colors.k_primerygreenColor,
                icon: Icons.arrow_back,
                onpress: () {
                  Navigator.pop(context);
                },
              ),
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width - 50,
              ),
            ),
            //todo logo
            Image.asset(
              "asset/img/logo.png",
              width: MediaQuery.of(context).size.width,
            ),
            //todo email

            //todo password
          ],
        ),
      ),
    );
  }
}
