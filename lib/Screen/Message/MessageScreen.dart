import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    // final doctor = Provider.of<Doctor>(context);

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
          )),
          PopupMenuButton<Menus>(
            onSelected: (Menus result) {
              // setState(() {
              //   _selection = result;
              // });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menus>>[
              PopupMenuItem<Menus>(
                value: Menus.schedule,
                child: Container(
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.push(context, createRoute(MainScreen())),
                    child: Text('Schedule'),
                  ),
                ),
              ),
              PopupMenuItem<Menus>(
                value: Menus.detail,
                child: Text('Show Profile'),
              ),
              PopupMenuItem<Menus>(
                value: Menus.end_sessions,
                child: Text('End Sessions'),
              ),
              PopupMenuItem<Menus>(
                value: Menus.report,
                child: Text('Report'),
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
                ownerId: _auth.currentUser.uid, idUser: widget.doctor.dId)
          ],
        ),
      ),
    );
  }
}

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: StreamBuilder<List<Doctor>>(
            stream: DoctorData().getdoctor(),
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
                        children: [ChatBodyWidget(doctor: snapshot.data)],
                      );
                  }
              }
            },
          ),
        ),
      );
}

enum Menus { schedule, detail, end_sessions, report }
