import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../index.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final colors = Appcolor();
  bool isvisble = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    //firbase intial

    //form key

    TapGestureRecognizer _recognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(context, createRoute(LoginScreen()));
      };
    return Scaffold(
      appBar: backAppBar(context: context, color: colors.k_white),
      backgroundColor: colors.k_white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,

            children: [
              //title
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.4),
                child: Text(
                  "Create ",
                  style: header1(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.4),
                child: Text(
                  " Account",
                  style: header1(),
                ),
              ),
              //todo Form
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 50),
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
                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 10),
                      child: BuildText(
                        lebel: "Full Name",
                        ispassword: false,
                        controler: name,
                        iconPrifix: Icon(
                          Icons.person,
                          color: colors.k_primerygreenColor,
                        ),
                        isvisble: false,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: BuildText(
                        lebel: "Password",
                        ispassword: true,
                        controler: password,
                        isvisble: isvisble,
                        onPress: () {
                          setState(
                            () {
                              isvisble = !isvisble;
                            },
                          );
                        },
                      ),
                    ),
                    //Todo terms
                    Container(
                      child: CheckBox1(
                        title: text(),
                        isChecked: isChecked,
                        onChange: (newValue) {
                          setState(() {
                            isChecked = newValue;
                          });
                        },
                        // controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Button1(
                        color: colors.k_primerygreenColor,
                        text: "Register",
                        onpress: () {
                          validators(context);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1),
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: body2(),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: colors.k_primerygreenColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: _recognizer,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
    try {
      final User newUser = (await _firebaseAuth
              .createUserWithEmailAndPassword(
                  email: email.text, password: password.text)
              .catchError((err) {
        DisplayMsg().displayMessage("Error ${err.toString()}", context);
      }))
          .user;
      if (newUser != null) {
        Map userDataMap = {
          "fullName": name.text.trim(),
          "email": email.text.trim(),
        };
        userRef.child(newUser.uid).set(userDataMap);
        print("congrat created new account!");
        Navigator.push(context, createRoute(VerificationScreen()));
      } else {}
    } catch (e) {
      DisplayMsg().displayMessage(e.toString(), context);
    }
  }

  void validators(BuildContext context) {
    if (email.text.isEmpty) {
      DisplayMsg().displayMessage("Please Enter an Email", context);
    } else if (!email.text.contains("@")) {
      DisplayMsg().displayMessage("Invalid Email", context);
    } else if (name.text.length < 4) {
      DisplayMsg().displayMessage("Name must be atlist 3 character", context);
    } else if (password.text.isEmpty) {
      DisplayMsg().displayMessage("Enter Password", context);
    } else if (password.text.length < 6) {
      DisplayMsg().displayMessage("Password must be > 6 character", context);
    } else {
      registerNewUser(context);
    }
  }

  Widget text() {
    final colors = Appcolor();
    TapGestureRecognizer _recognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(context, createRoute(TermScreen()));
      };
    return RichText(
      text: TextSpan(
        text: 'I agree the ',
        style: body1(),
        children: <TextSpan>[
          TextSpan(
            recognizer: _recognizer,
            text: 'term',
            style: TextStyle(
              color: colors.k_primerygreenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: ' and'),
          TextSpan(
            text: ' condition!',
            recognizer: _recognizer,
            style: TextStyle(
                color: colors.k_primerygreenColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
