import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "../../index.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//form key
  final _formkey = GlobalKey<FormState>();
  // input
  final email = TextEditingController();
  final password = TextEditingController();

  bool isvisble = true;
  bool isChecked = false;
  bool isloading = true;
  final auth = AuthControlle();
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
        appBar: backAppBar(context: context, color: colors.k_white),
        backgroundColor: Colors.white,
        body: isloading
            ? SafeArea(
                child: SingleChildScrollView(
                child: Column(
                  children: [
                    //todo logo
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Logo(context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    //todo  Form
                    Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 30, top: 30),
                              child: BuildText(
                                lebel: "Email",
                                ispassword: false,
                                controler: email,
                                iconPrifix: Icon(
                                  Icons.email,
                                  color: colors.k_primerygreenColor,
                                ),
                                isvisble: false,
                              ),
                            ),
                            //todo password
                            Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: BuildText(
                                lebel: "Password",
                                ispassword: true,
                                controler: password,
                                isvisble: isvisble,
                                onPress: () {
                                  setState(() {
                                    isvisble = !isvisble;
                                  });
                                },
                              ),
                            ),
                            // check box
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: CheckBox1(
                                onChange: (newValue) {
                                  setState(() {
                                    isChecked = newValue;
                                  });
                                },
                                title: Text("Remember Me"),
                                isChecked: isChecked,
                              ),
                            ),
                            //todo button
                            SizedBox(
                              height: 20,
                            ),

                            Container(
                              child: Button1(
                                color: colors.k_primerygreenColor,
                                text: "login",
                                onpress: () {
                                  validetor(context);
                                },
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ))
            : CustomProgress().progress());
  }

//validate a textfild
  void validetor(BuildContext context) async {
    // print("what");
    if (email.text.isEmpty) {
      DisplayMsg()
          .displayMessage(msg: "Please Enter an Email", context: context);
    } else if (!email.text.contains("@")) {
      DisplayMsg().displayMessage(msg: "Invalid Email", context: context);
    } else if (password.text.isEmpty) {
      DisplayMsg().displayMessage(msg: "Enter Password", context: context);
    } else if (password.text.length < 6) {
      DisplayMsg().displayMessage(
          msg: "Password must be > 6 character", context: context);
    } else {
      setState(() {
        isloading = false;
      });
      final u =
          await auth.login(email.text.trim(), password.text.trim(), context);

      if (u) {
        setState(() {
          isloading = false;
          DisplayMsg().displayMessage(
              msg: "Welcome Back", context: context, iserror: false);

          Navigator.push(context, createRoute(HomeScreen1()));
        });
      } else {
        print("this is");
        setState(() {
          isloading = true;
        });
      }
    }
  }
}
