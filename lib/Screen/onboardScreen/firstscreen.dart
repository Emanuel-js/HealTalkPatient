import "package:flutter/material.dart";
import '../../index.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();

    return Scaffold(
      backgroundColor: colors.k_white,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Todo title

              Text(
                "Your #1 Choice",
                style: header1(),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Logo(context),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //button 1
                  Button1(
                    text: "Register",
                    color: colors.k_primerygreenColor,
                    onpress: () {
                      Navigator.push(
                          context,
                          createRoute(
                            RegisterScreen(),
                          ));
                    },
                  ),

                  //button 2
                  OutlineButton1(
                    text: "Login",
                    color: colors.k_primerygreenColor,
                    onpress: () {
                      Navigator.push(
                          context,
                          createRoute(
                            LoginScreen(),
                          ));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
