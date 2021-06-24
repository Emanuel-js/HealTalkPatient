import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

import '../../index.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final age = TextEditingController();
  String gender = "Male";

  final colors = Appcolor();
  final auth = AuthControlle();
  bool isvisble = true;
  bool isloading = true;
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
        child: isloading
            ? SingleChildScrollView(
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
                              keybordType: TextInputType.emailAddress,
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
                              lebel: "First Name",
                              ispassword: false,
                              controler: firstName,
                              iconPrifix: Icon(
                                Icons.person,
                                color: colors.k_primerygreenColor,
                              ),
                              isvisble: false,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20, top: 10),
                            child: BuildText(
                              lebel: "Last Name",
                              ispassword: false,
                              controler: lastName,
                              iconPrifix: Icon(
                                Icons.person,
                                color: colors.k_primerygreenColor,
                              ),
                              isvisble: false,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20, top: 10),
                            child: BuildText(
                              lebel: "Age",
                              ispassword: false,
                              controler: age,
                              keybordType: TextInputType.number,
                              isvisble: false,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 30),
                            child: genderpik(),
                          ),
                          SizedBox(
                            height: 10,
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
                            height: 20,
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

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
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
              )
            : CustomProgress().progress(),
      ),
    );
  }

  Widget genderpik() {
    return Container(
      child: GenderPickerWithImage(
        showOtherGender: false,
        verticalAlignedText: false,
        selectedGender: Gender.Male,
        selectedGenderTextStyle: TextStyle(
            color: colors.k_primerygreenColor, fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.normal),

        onChanged: (Gender g) {
          g.index == 0 ? gender = "Male" : gender = "Female";

          print(gender);
        },
        equallyAligned: true,
        animationDuration: Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 50, //default : 40
      ),
    );
  }

  Future<void> validators(BuildContext context) async {
    if (email.text.isEmpty) {
      DisplayMsg()
          .displayMessage(msg: "Please Enter an Email", context: context);
    } else if (!email.text.contains("@")) {
      DisplayMsg().displayMessage(msg: "Invalid Email", context: context);
    } else if (firstName.text.length < 4 && lastName.text.length < 4) {
      DisplayMsg().displayMessage(
          msg: "Name must be atlist 3 character", context: context);
    } else if (int.parse(age.text) < 18) {
      DisplayMsg().displayMessage(
          msg: "Name must be atlist 3 character", context: context);
    } else if (password.text.isEmpty) {
      DisplayMsg().displayMessage(msg: "Age must be +18", context: context);
    } else if (password.text.length < 6) {
      DisplayMsg().displayMessage(
          msg: "Password must be > 6 character", context: context);
    } else {
      setState(() {
        isloading = false;
      });
      final u = await auth.regsiter(firstName.text.trim(), lastName.text.trim(),
          email.text.trim(), password.text.trim(), gender.trim(), context);

      if (u) {
        setState(() {
          isloading = false;
          Navigator.pushReplacement(context, createRoute(VerificationScreen()));
          DisplayMsg().displayMessage(
            msg: "You are Seccsessfuly registerd",
            context: context,
          );
        });
      } else {
        setState(() {
          isloading = true;
        });
      }
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
