import 'package:flutter/material.dart';
import '../index.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final varificationControler = TextEditingController();

    final colors = Appcolor();
    return Scaffold(
      appBar: backAppBar(context: context, color: colors.k_bkColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //title
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.4),
                child: Text(
                  "Confirmation  ",
                  style: header1(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.63),
                child: Text(
                  "code",
                  style: header1(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),

//Todo card

              Container(
                padding: EdgeInsets.all(50),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: colors.k_white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 10), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(children: [
                  Container(
                    child: BuildText(
                      ispassword: false,
                      controler: varificationControler,
                      isvisble: false,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    child: Button1(
                      color: colors.k_primerygreenColor,
                      text: "Varify",
                      onpress: () {
                        Navigator.push(
                            context, createRoute(HomeScreen1(), context));
                      },
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
