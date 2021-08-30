import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healTalkpatient/index.dart';

class MessageControler {
  CollectionReference messageCollection =
      FirebaseFirestore.instance.collection('Messages');

  final _auth = FirebaseAuth.instance.currentUser;
  // Message _getdatafromSnapshot(DocumentSnapshot value) {
  //   return Message(

  //}
  Future<void> sendMessages(String message, String reciverId, String date) {
    // Call the user's CollectionReference to add a new user
    messageCollection
        .doc()
        .collection("message")
        .doc()
        .set({
          "senderID": _auth.uid,
          "reciverId": reciverId,
          "message": message,
          "date": date
        })
        .then((value) => print("message  is sennded!"))
        .catchError((error) => print("Failed to send message: $error"));
  }

  // List<Message> _messagelist(QuerySnapshot snapshot) {
  //   print("out out");
  //   return snapshot.docs.map((doc) {
  //     return Message(
  //       senderId: doc.data['senderId'] ?? "",
  //       reciverId: doc['senderId'] ?? "",
  //       message: doc['senderId'] ?? "",
  //       sendingDate: doc['senderId'] ?? "",
  //     );
  //   }).toList();
  // }

  Stream get messages {
    messageCollection.doc(_auth.uid).collection("message").snapshots();
    print("in in");
  }
}
