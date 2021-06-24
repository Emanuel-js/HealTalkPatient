import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';

class MainScreen extends StatelessWidget {
  bool isrequsest = false;

  List<Doctor> doctor = [
    Doctor(
        name: "DR. Natnael Tassew",
        detail:
            "psychologist and physician lsorempsychologist andphysician lsorem",
        expriance: "Expriance",
        focus: "hffj",
        gender: "M",
        rate: "4.3",
        img: "asset/img/pic.jpg",
        disc: "15 years in practice",
        id: 0),
    Doctor(
        name: "DR. Amanuel Awol",
        detail:
            "psychologist and physician lsorempsychologist andphysician lsorem",
        expriance: "Expriance",
        focus: "hffj",
        gender: "M",
        rate: "4.3",
        disc: "15 years in practice",
        img: "asset/img/pic.jpg",
        id: 1),
    Doctor(
        name: "DR. Yeheyes Melaku",
        detail:
            "psychologist and physician lsorempsychologist andphysician lsorem",
        expriance: "Expriance",
        focus: "hffj",
        gender: "M",
        rate: "4.3",
        disc: "15 years in practice",
        img: "asset/img/pic.jpg",
        id: 2),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Appcolor();

    return Scaffold(
      body: Container(
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
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Cards(
                        name: doctor[index].name,
                        disc: doctor[index].detail,
                        profile: doctor[index].img,
                        rate: doctor[index].rate,
                        id: index,
                        // color: isrequsest
                        //     ? colors.k_redColor
                        //     : colors.k_primerygreenColor,
                        btn: dynmaicBtn(context, index, doctor[index].id),
                        onDetail: () {
                          Navigator.push(
                            context,
                            createRoute(
                              DetailScreen(
                                name: doctor[index].name,
                                detail: doctor[index].detail,
                                img: doctor[index].img,
                                rate: doctor[index].rate,
                                id: index,
                                disc: doctor[index].disc,
                                expriance: doctor[index].expriance,
                              ),
                            ),
                          );
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }

  Widget dynmaicBtn(BuildContext context, int index, int id) {
    final colors = Appcolor();
    // print("indx= ${index}\n id = ${id}");
    return Button2(
      color: colors.k_primerygreenColor,
      text: "Request",
      onpress: () {
        // setState(() {
        //   isrequsest = true;
        // });
        _showDialog(context, id, index);
        // controleRequest(context, id, index);
      },
    );
    // Button2(
    //     color: colors.k_redColor,
    //     text: "Cancel",
    //     onpress: () {
    //       _rejectRequest(context);
    //     },
    //   )
  }

  Widget controleRequest(BuildContext context, int id, int index) {
    final colors = Appcolor();
    if (id == index) {
      return Button2(
        color: colors.k_redColor,
        text: "Cancel",
        onpress: () {
          _rejectRequest(context);
        },
      );
    }
  }

  void _rejectRequest(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Do you Want to cancel the request?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'No');
                  // setState(() {
                  //   isrequsest = false;
                  //   // notrequest = false;
                  // });
                },
                child: const Text('yes'),
              ),
              TextButton(
                onPressed: () => {
                  Navigator.pop(context, 'No'),
                  // setState(() {
                  //   isrequsest = true;
                  //   // notrequest = true;
                  // })
                },
                child: const Text('No'),
              ),
            ],
          );
        });
  }

  void _showDialog(BuildContext context, int id, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.green,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: GestureDetector(
              onTap: () {
                Navigator.pop(context, 'No');
                // setState(() {
                //   _rejectRequest(context);
                // });
              },
              child: Container(
                height: 200,
                child: Column(children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("asset/img/check-circle.gif"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "congrats you selected your doctor",
                    style: body1(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ),
            ));
      },
    );
  }
}
