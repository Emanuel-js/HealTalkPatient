import 'package:flutter/material.dart';
import 'package:healTalkpatient/Component/buildTextFild.dart';
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
                  child: IconBtn(
                    color: colors.k_primerygreenColor,
                    icon: Icons.arrow_back,
                    onpress: () {
                      Navigator.pop(context);
                    },
                  ),
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width - 50, top: 20),
                ),
                //todo logo
                Image.asset(
                  "asset/img/logo.png",
                  width: MediaQuery.of(context).size.width,
                ),
                //todo email
                Container(
                  padding: EdgeInsets.all(30),
                  child: BuildText(
                    lebel: "Email",
                    ispassword: false,
                    controler: emailControler,
                    iconPrifix: Icon(Icons.email),
                    isvisble: false,
                  ),
                ),
                //todo password
                Container(
                  padding: EdgeInsets.all(30),
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
                CheckboxListTile(
                  title: Text("Remember me"),
                  value: isChecked,
                  checkColor: colors.k_white,
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
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
                        "Email: ${emailControler.text} \n password: ${passwordControler.text}")
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
