import "package:flutter/material.dart";
import '../../index.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();

    return Scaffold(
      backgroundColor: colors.k_white,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Todo title
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              "Your #1 Choice",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Center(
              child: Image.asset(
                "asset/img/logo.png",
                width: MediaQuery.of(context).size.width - 10,
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //button 1
                Button1(
                  text: "Register",
                  color: colors.k_primerygreenColor,
                  onpress: () {
                    Navigator.push(context, createRoute(RegisterScreen()));
                  },
                ),

                //button 2
                OutlineButton1(
                  text: "Login",
                  color: colors.k_primerygreenColor,
                  onpress: () {
                    Navigator.push(context, createRoute(LoginScreen()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
