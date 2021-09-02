import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../index.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();
    final req = Provider.of<Request>(context);
    return Scaffold(
        appBar: backAppBar(context: context, color: colors.k_bkColor),
        body: Column(
          children: [
            Container(
              child: Text(
                "Notification",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: req == null
                  ? CustomProgress().progress()
                  : SafeArea(
                      child: Container(
                          child: StreamBuilder<Doctor>(
                              stream: DoctorData()
                                  .getsingleDoctor("dNxllvTQJ9P4YK1NgojD"),
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
                                              style: header2(
                                                  color: colors.k_white),
                                            ),
                                            subtitle: Container(
                                              margin: EdgeInsets.only(top: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    child: Button1(
                                                        text: "cancel",
                                                        color:
                                                            colors.k_redColor),
                                                  ),
                                                  SizedBox(
                                                    width: 40,
                                                  ),
                                                  Container(
                                                    child: Button1(
                                                      color: colors
                                                          .k_primerygreenColor,
                                                      text: "accept",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ));
                              }))),
            )
          ],
        ));
  }

  // Widget handleNotification(Request req) {
  //   // final data = Provider.of<Doctor>(context);
  //   // print(req.reqReciverId);
  //   if (req.isaccepted) {
  //     return StreamBuilder<Doctor>(
  //         stream: DoctorData().getsingleDoctor(req.reqOwnerId),
  //         builder: (context, snapshot) {
  //           print(req.reqReciverId);
  //           if (!snapshot.hasData) return CustomProgress().progress();
  //           final data = snapshot.data;
  //           return Container(
  //             child: ListTile(
  //               title: Text(
  //                 data.fullName,
  //                 style: header1(),
  //               ),
  //             ),
  //           );
  //         });
  //   } else {
  //     return Center(
  //         child: Container(
  //       child: Text("No Notification"),
  //     ));
  //   }
  // }
}
