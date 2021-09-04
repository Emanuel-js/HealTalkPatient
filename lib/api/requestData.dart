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
      requtSender: _auth.currentUser.uid,
      isaccepted: false,
      timestamps: DateTime.now(),
    );
    await refRequests.doc(_auth.currentUser.uid).set(newRequest.toJson());

//     Map data = {"requtSender": Doctor().requestSender(_auth.currentUser.uid)};

// "Item": FieldValue.arrayUnion([
//             {
//               "name": itemName.toList()[0],
//               "price": rate.toList()[0],
//               "quantity": quantity.toList()[0]
//             },
//            {
//               "name": itemName.toList()[1],
//               "price": rate.toList()[1],
//               "quantity": quantity.toList()[1]
//             },
//           ]),

    // String id = "PteMaAT6IDSs34gdjHLVLRsBpRA2";
    await doctorCollection
        .doc(reqReciverId)
        .update(Doctor().requestSender(_auth.currentUser.uid))
        .whenComplete(() => DisplayMsg().displayMessage(
            msg: "Request send for the Doctor!", context: context));
  }

  Future updateRequest(bool state) async {
    Map<String, dynamic> data = <String, dynamic>{
      "requtSender": _auth.currentUser.uid,
      "state": state,
    };
    await refRequests.doc(_auth.currentUser.uid).update(data).whenComplete(() =>
        DisplayMsg()
            .displayMessage(msg: "You request is Updated", context: context));
  }

  Request _getrequest(DocumentSnapshot json) {
    // print("request.......");
    // print(json.data());
    // print("request.......");

    return Request().fromJson(json.data());
  }

  Stream<Request> get request =>
      refRequests.doc(_auth.currentUser.uid).snapshots().map(_getrequest);
}
