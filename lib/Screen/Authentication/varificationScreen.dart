import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../index.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final auth = FirebaseAuth.instance;

  User user;

  // Timer timer;

  @override

  // users = auth.currentUser;
  // users.sendEmailVerification();

  // Timer.periodic(Duration(seconds: 10), (timer) {
  //   checkEmailvef();
  // });
  // super.initState();

  bool _isUserEmailVerified;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    // ... any code here ...
    Future(() async {
      _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
        await user.reload();
        user = auth.currentUser;
        if (user.emailVerified) {
          setState(() {
            _isUserEmailVerified = user.emailVerified;
          });
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    return _isUserEmailVerified
        ? Navigator.push(context, createRoute(HomeScreen1()))
        : Scaffold(
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
                        "Confirm your   ",
                        style: header1(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.63),
                      child: Text(
                        "Email",
                        style: header1(),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),

                    msg("Confirm your Email ${user.email}")
//Todo card
                  ],
                ),
              ),
            ),
          );
  }

  // Future<void> checkEmailvef() async {
  //   user = auth.currentUser;
  //   // await users.reload();
  //   if (user.emailVerified) {
  //     // msg("your Email is Varified");
  //     _timer.cancel();
  //     Navigator.push(context, createRoute(HomeScreen1()));
  //   }
  // }

  Widget msg(String msg) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Text(
        msg,
        style: body1(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
