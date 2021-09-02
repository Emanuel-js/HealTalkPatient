import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healTalkpatient/index.dart';
import 'package:provider/provider.dart';

class MessagesWidget extends StatelessWidget {
  final String idUser;
  final String ownerId;

  const MessagesWidget({
    @required this.idUser,
    @required this.ownerId,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    // final data = Provider.of<Doctor>(context);
    final doctor = Provider.of<List<Message>>(context);
    return StreamBuilder<List<Message>>(
        stream: FirebaseApi().getMessagesFromdoctor(ownerId),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  "say Hi!",
                  style: header1(),
                ),
              ),
            );
          final ownerMsg = snapshot.data;

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            reverse: true,
            itemCount: ownerMsg.length,
            itemBuilder: (context, index) {
              final ownerMsgs = ownerMsg[index];
              // final message = doctor[index];
              print("owner Id = $ownerId");
              print("userID =$idUser");
              return MessageWidget(
                // ownermessage: ownerMsgs,
                message: ownerMsgs,
                isMe: ownerMsgs.ownerId == ownerId,
              );
            },
          );
        });
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}
