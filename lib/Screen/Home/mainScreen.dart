import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isrequsest = false;

  Timer _timer;
  void _startTimer() {
    _timer = Timer.periodic(Duration(minutes: 300), (timer) {
      RequestApi().updateRequest(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final data = Provider.of<List<Doctor>>(context);

    return Scaffold(
        body: data != null
            ? Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Based on your criteria , these are the best matches for you",
                      style: body1(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: data == null
                            ? Text("no data")
                            : ListView.builder(
                                itemCount: data?.length,
                                itemBuilder: (context, index) {
                                  return Cards(
                                    data: data[index],
                                    color: isrequsest
                                        ? colors.k_redColor
                                        : colors.k_primerygreenColor,
                                    btn: dynmaicBtn(context, data[index].dId),
                                    onDetail: () {
                                      Navigator.push(
                                        context,
                                        createRoute(
                                          DetailScreen(data: data[index]),
                                        ),
                                      );
                                    },
                                  );
                                }))
                  ],
                ),
              )
            : CustomProgress().progress());
  }

  Widget dynmaicBtn(BuildContext context, String id) {
    final colors = Appcolor();
    final request = Provider.of<Request>(context);
    print(request);
    if (request == null)
      return Button2(
        color: colors.k_primerygreenColor,
        text: "Request",
        onpress: () {
          showAlertDialog(
              context, "Are you sure?", "Continue to request a doctor", id);
        },
      );

    if (request.state == true &&
        request.reqReciverId == id &&
        request.isaccepted == false) {
      return Button1(
          text: "waiting doctor",
          color: colors.k_gray2,
          onpress: () {
            Navigator.push(context, createRoute(WaitScreen()));
          });
    } else if (request.state == true && request.isaccepted == false) {
      return Button1(
          text: "waiting doctor",
          color: colors.k_gray2,
          onpress: () {
            DisplayMsg().displayMessage(
                msg:
                    "Already sent request please wait until the doctor is back to you",
                context: context);
          });
    } else if (request.state == true && request.isaccepted == true) {
      return Button2(
        color: colors.k_primerygreenColor,
        text: "enjoy your sessions",
        onpress: () {
          // _timer.cancel();
          DisplayMsg().displayMessage(
              msg: "You already get a doctor please end your session first!",
              context: context);
        },
      );
    } else {
      return Button2(
        color: colors.k_primerygreenColor,
        text: "Request",
        onpress: () {
          // _timer.cancel();
          showAlertDialog(
              context, "Are you sure?", "Continue to request a doctor", id);
        },
      );
    }
  }

  _handelRequest(String id) {
    // final request = Provider.of<Request>(context);
    print(id);
    setState(() {
      if (isrequsest) {
        _startTimer();
        RequestApi().sendRequest(isrequsest, id);
        Navigator.pushReplacement(context, createRoute(WaitScreen()));
      }
    });
  }

  showAlertDialog(BuildContext context, String title, String disc, String id) {
    // set up the buttons
    final colors = Appcolor();
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: colors.k_primerygreenColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(title,
          style: header2(
            color: colors.k_white,
          )),
      content: Text(disc,
          style: body1(
            color: colors.k_white,
          )),
      actions: [
        Button1(
          text: "Cancel",
          color: Colors.red,
          onpress: () {
            isrequsest = false;
            Navigator.pop(context);
          },
        ),
        Button1(
          color: Colors.blueGrey,
          text: "Continue",
          onpress: () {
            isrequsest = true;
            _handelRequest(id);
            // print("ppp");
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
