import 'package:flutter/material.dart';
import "../index.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  bool isvisble = true;
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    emailControler.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //todo back arrow

                Container(
                  margin: EdgeInsets.only(top: 20),
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
                //todo logo
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Logo(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                //todo email
                Container(
                  margin: EdgeInsets.only(bottom: 30, top: 30),
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
                //todo password
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: BuildText(
                    lebel: "Password",
                    ispassword: true,
                    controler: passwordControler,
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
                    title: "Remember Me",
                    isChecked: isChecked,
                  ),
                ),
                //todo button
                SizedBox(
                  height: 20,
                ),

                Button1(
                  color: colors.k_primerygreenColor,
                  text: "login",
                  onpress: () => {
                    print(
                        "Email: ${emailControler.text} \n password: ${passwordControler.text} ischecked = ${isChecked}")
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
