import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import './../index.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final emailControler = TextEditingController();
    final passwordControler = TextEditingController();
    final fullnameControler = TextEditingController();
    final colors = Appcolor();
    bool isvisble = true;
    bool isChecked = false;

    @override
    void initState() {
      super.initState();
      emailControler.addListener(() {
        setState(() {});
      });
    }

    TapGestureRecognizer _recognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(context, createRoute(LoginScreen(), context));
      };
    return Scaffold(
      appBar: backAppBar(context: context, color: colors.k_white),
      backgroundColor: colors.k_white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
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
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 50),
                  child: BuildText(
                    lebel: "Email",
                    ispassword: false,
                    controler: emailControler,
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
                    controler: fullnameControler,
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
                    controler: passwordControler,
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
                CheckboxListTile(
                  title: text(),
                  value: isChecked,
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                SizedBox(
                  height: 40,
                ),
                Button1(
                  color: colors.k_primerygreenColor,
                  text: "Register",
                  onpress: () => {
                    Navigator.push(
                        context, createRoute(VerificationScreen(), context)),
                    print(
                        "Email: ${emailControler.text} \n password: ${passwordControler.text} ischecked = ${isChecked}")
                  },
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
          ),
        ),
      ),
    );
  }

  Widget text() {
    final colors = Appcolor();
    TapGestureRecognizer _recognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(context, createRoute(TermScreen(), context));
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
