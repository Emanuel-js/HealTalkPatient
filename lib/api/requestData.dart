import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healTalkpatient/index.dart';
import 'package:path/path.dart';

class RequestApi {
  final _auth = FirebaseAuth.instance;
  static final refRequests = FirebaseFirestore.instance.collection('Request');
  static final doctorCollection =
      FirebaseFirestore.instance.collection('Doctor');

  Future sendRequest(bool state, String reqReciverId) async {
    final newRequest = Request(
      state: state,
      reqReciverId: reqReciverId,
      reqOwnerId: _auth.currentUser.uid,
      isaccepted: false,
      timestamps: DateTime.now(),
    );
    await refRequests.doc(_auth.currentUser.uid).set(newRequest.toJson());
    Map<String, dynamic> data = <String, dynamic>{
      "isRequstSend": state,
      "requtSender": _auth.currentUser.uid,
      "requestStatus": state,
    };
    String id = "dNxllvTQJ9P4YK1NgojD";
    await doctorCollection.doc(id).update(data).whenComplete(() => DisplayMsg()
        .displayMessage(msg: "Request send for the Doctor!", context: context));
  }

  //get request

  Request _getrequest(DocumentSnapshot snapshot) {
    print("Request");
    print(snapshot);
    return Request(
      isaccepted: snapshot["isaccepted"],
      reqOwnerId: snapshot["reqOwnerId"],
      reqReciverId: snapshot["reqReciverId"],
      state: snapshot["state"],
      timestamps: Utils.toDateTime(snapshot["timestamps"]),
    );
  }

  Stream<Request> get request =>
      refRequests.doc(_auth.currentUser.uid).snapshots().map(_getrequest);
}
