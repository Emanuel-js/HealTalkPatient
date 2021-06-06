import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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

  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
      appBar: backAppBar(context: context, color: colors.k_white),
      backgroundColor: Colors.white,
      body: SafeArea(
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
        ),
      ),
    );
  }

//login

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginUser(BuildContext context) async {
    try {
      final User newUser = (await _firebaseAuth
              .signInWithEmailAndPassword(
                  email: email.text, password: password.text)
              .catchError((err) {
        DisplayMsg(msg: "Error ${err.toString()}", context: context);
      }))
          .user;
      if (newUser != null) {
        userRef.child(newUser.uid).once().then((value) => (DataSnapshot snap) {
              if (snap.value != null) {
                Navigator.push(context, createRoute(VerificationScreen()));
                DisplayMsg().displayMessage("Welcome Back", context);
              } else {
                _firebaseAuth.signOut();
                DisplayMsg().displayMessage("No recorde exist!", context);
              }
            });
      } else {
        DisplayMsg()
            .displayMessage("Error occourd you can't sign in!", context);
      }
    } catch (e) {
      DisplayMsg().displayMessage(
          "The Email is not Registered! please Register First", context);
    }
  }

//validate a textfild
  void validetor(BuildContext context) {
    if (email.text.isEmpty) {
      DisplayMsg().displayMessage("Please Enter an Email", context);
    } else if (!email.text.contains("@")) {
      DisplayMsg().displayMessage("Invalid Email", context);
    } else if (password.text.isEmpty) {
      DisplayMsg().displayMessage("Enter Password", context);
    } else if (password.text.length < 6) {
      DisplayMsg().displayMessage("Password must be > 6 character", context);
    } else {
      loginUser(context);
    }
  }
}
