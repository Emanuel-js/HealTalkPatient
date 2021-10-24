import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:healTalkpatient/index.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ChatPage extends StatefulWidget {
  final Doctor doctor;

  const ChatPage({
    @required this.doctor,
    Key key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final colors = Appcolor();
  final _auth = FirebaseAuth.instance;
  String reports = '';
  bool isdone = false;
  List<S2Choice<String>> report = [
    S2Choice<String>(value: 'Report violence', title: 'violence'),
    S2Choice<String>(value: 'Report harassment', title: 'harassment'),
  ];
  @override
  Widget build(BuildContext context) {
    //  final doctor = Provider.of<Doctor>(context);
    final pa = Provider.of<Patient>(context);
    String url;
    if (pa != null) {
      url = pa.picture;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colors.k_bkColor,
        leading: Container(
          child: IconBtn(
            color: colors.k_seconderypurpleColor,
            icon: Icons.arrow_back_ios,
            onpress: () {
              Navigator.pop(context);
            },
          ),
        ),
        elevation: 0,
        actions: [
          Container(
            child: Hero(
              tag: "pro",
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.doctor.img),
              ),
            ),
          ),
          Container(
              child: IconBtn(
            icon: Icons.phone,
            onpress: () {
              UrlLauncher.launch('tel:+${widget.doctor.phone.toString()}');
              // callnow(widget.doctor.phone);
            },
          )),
          PopupMenuButton<Menus>(
            onSelected: (Menus result) {
              // setState(() {
              //   _selection = result;
              // });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menus>>[
              PopupMenuItem<Menus>(
                value: Menus.detail,
                child: Container(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context,
                        createRoute(DetailScreen(data: widget.doctor))),
                    child: Text('Show Profile'),
                  ),
                ),
              ),
              PopupMenuItem<Menus>(
                value: Menus.end_sessions,
                child: Container(
                  child: GestureDetector(
                    onTap: () => showAlertDialog(
                        context, widget.doctor.dId), //showAlertDialog(context),
                    child: Text('End Session'),
                  ),
                ),
              ),
              PopupMenuItem<Menus>(
                value: Menus.report,
                child: Container(
                  child: GestureDetector(
                    onTap: () => showReport(
                        context, widget.doctor.dId), //showAlertDialog(context),
                    child: Text('Report'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ProfileHeaderWidget(name: widget.user.firstName),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                color: colors.k_white,
                child: MessagesWidget(
                  idUser: widget.doctor.dId,
                  ownerId: _auth.currentUser.uid,
                ),
              ),
            ),

            NewMessageWidget(
                ownerId: _auth.currentUser.uid,
                idUser: widget.doctor.dId,
                avaterUrl: url)
          ],
        ),
      ),
    );
  }

  Widget getFocusOption(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: colors.k_bkColor, borderRadius: BorderRadius.circular(10)),
      child: SmartSelect<String>.single(
          modalType: S2ModalType.popupDialog,
          title: 'Report',
          value: reports,
          modalFilter: false,
          modalHeader: false,
          modalStyle: S2ModalStyle(backgroundColor: colors.k_bkColor),
          choiceStyle: S2ChoiceStyle(
              accentColor: Colors.blueAccent,
              clipBehavior: Clip.antiAlias,
              color: colors.k_purplecolor,
              activeColor: colors.k_primerygreenColor),
          choiceType: S2ChoiceType.chips,
          // choiceGrouped: true,
          choiceItems: report,
          onChange: (state) {
            setState(() {
              reports = state.value;
            });
          }),
    );
  }

  showReport(BuildContext context, id) {
    final colors = Appcolor();
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: colors.k_primerygreenColor,
      // contentPadding: EdgeInsets.all(30),
      actionsPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text("Report Any violation ",
          style: header2(
            color: colors.k_white,
          )),

      actions: [
        getFocusOption(context),
        Button1(
          text: "send",
          color: Colors.black26,
          onpress: () {
            RequestApi().sendReport(reports, id);
          },
        )
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

  showAlertDialog(BuildContext context, id) {
    // set up the buttons
    final colors = Appcolor();
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: colors.k_primerygreenColor,
      // contentPadding: EdgeInsets.all(30),
      actionsPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text("Are you sure ?",
          style: header2(
            color: colors.k_white,
          )),
      content: Text("End Session",
          style: body1(
            color: colors.k_white,
          )),
      actions: [
        Button1(
          text: "Cancel",
          color: Colors.red,
          onpress: () {
            Navigator.pop(context);
          },
        ),
        Button1(
            color: Colors.blueGrey,
            text: "Continue",
            onpress: () {
              ratting(context, id);
            }),
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

  ratting(BuildContext context, id) {
    // set up the buttons
    final colors = Appcolor();
    // set up the AlertDialog
    double rate;
    AlertDialog alert = AlertDialog(
      backgroundColor: colors.k_purplecolor,
      // contentPadding: EdgeInsets.all(30),
      actionsPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text("Rate Your Doctor 😎",
          style: header2(
            color: colors.k_white,
          )),

      actions: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: colors.k_primerygreenColor,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              rate = rating;
            });
            DisplayMsg().displayMessage(
                context: context, msg: "Thanks for your rate! ");
            DoctorData().addRate(id, rate);
            RequestApi().endSessions(false);
            Navigator.pop(context);
            Navigator.push(context, createRoute(HomeScreen1()));
          },
        )
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

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Other>(context);

    return Scaffold(
      body: SafeArea(
        child: info != null
            ? StreamBuilder<Doctor>(
                stream: DoctorData().getsingleDoctor(info.acceptedDoctorID),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(
                            child: Text("Something Went Wrong Try later"));
                      } else {
                        final users = snapshot.data;

                        if (!snapshot.hasData) {
                          return Text("No Users Found");
                        } else
                          return Column(
                            children: [ChatBodyWidget(doctor: users)],
                          );
                      }
                  }
                },
              )
            : CustomProgress().progress(),
      ),
    );
  }
}

enum Menus { schedule, detail, end_sessions, report }
