import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<Doctor> doctor;

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
          child: buildChats(),
        ),
      );

  Widget buildChats() => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = doctor[index];

          return Container(
            height: 75,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatPage(doctor: user),
                ));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user.img),
              ),
              title: Text(user.fullName),
            ),
          );
        },
        itemCount: doctor.length,
      );
}
