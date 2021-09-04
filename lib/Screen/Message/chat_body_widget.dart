import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';
import 'package:provider/provider.dart';

class ChatBodyWidget extends StatelessWidget {
  final Doctor doctor;

  const ChatBodyWidget({
    this.doctor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: buildChats(context),
        ),
      );

  Widget buildChats(context) {
    final info = Provider.of<Other>(context);
    final req = Provider.of<Request>(context);
    if (info == null && req == null) return Text("null");

    if (info.acceptedDoctorID == doctor.dId || req.isaccepted == true) {
      return Container(
        height: 75,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChatPage(doctor: doctor),
            ));
          },
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(doctor.img),
          ),
          title: Text(doctor.fullName),
        ),
      );
    } else {
      return Container(
        child: Center(child: Text("No Doctor Arrived 😞")),
      );
    }
  }
}
