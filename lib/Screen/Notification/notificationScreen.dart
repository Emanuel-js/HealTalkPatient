import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../index.dart';

class NotificationScreen extends StatefulWidget {
  // NotificationScreen();
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isacc = false;
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final req = Provider.of<Request>(context);
    setState(() {
      if (req != null) isacc = !req.isaccepted;
    });
    return Scaffold(
        appBar: backAppBar(context: context, color: colors.k_bkColor),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Notification",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            isacc
                ? Center(child: Text("No Notification", style: body1()))
                : Container(
                    child: notifcationHandler(req, context),
                  )
          ],
        ));
  }

  notifcationHandler(Request req, context) {
    final colors = Appcolor();
    return Container(
      child: req == null
          ? Center(
              child: Text(
              "No Notification",
            ))
          : SafeArea(
              child: Container(
                  child: StreamBuilder<Doctor>(
                      stream: DoctorData().getsingleDoctor(req.reqReciverId),
                      builder: (context, snapshot) {
                        print(req.reqReciverId);
                        if (!snapshot.hasData)
                          return CustomProgress().progress();
                        final data = snapshot.data;
                        return Align(
                            alignment: Alignment.topCenter,
                            child: Card(
                              margin: EdgeInsets.all(10),
                              elevation: 20,
                              color: colors.k_purplecolor,
                              child: Container(
                                // width:
                                //     MediaQuery.of(context).size.width * 0.8,
                                child: ListTile(
                                    contentPadding: EdgeInsets.all(20),
                                    tileColor: colors.k_purplecolor,
                                    title: Text(
                                      "${data.fullName} is expecting you!",
                                      textAlign: TextAlign.center,
                                      style: header2(color: colors.k_white),
                                    ),
                                    subtitle: Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Container(
                                            child: Button1(
                                                color:
                                                    colors.k_primerygreenColor,
                                                text: "accept",
                                                onpress: () {
                                                  setState(() {
                                                    OtherApi().sendOther(
                                                        isacc, data.dId);
                                                    isacc = !req.isaccepted;
                                                  });
                                                  Navigator.pushReplacement(
                                                      context,
                                                      createRoute(ChatPage(
                                                        doctor: data,
                                                      )));
                                                }),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ));
                      }))),
    );
  }
}
