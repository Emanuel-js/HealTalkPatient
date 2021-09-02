import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healTalkpatient/index.dart';

class DoctorData {
  final CollectionReference doctorCollection =
      FirebaseFirestore.instance.collection('Doctor');

  List<Doctor> _getDoctor(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      // print(doc["createdDate"]);
      return Doctor(
        fullName: doc["fullName"],
        gender: doc["gender"],
        expriance: doc["expriance"],
        rate: doc["rate"],
        focus: doc["focus"],
        detail: doc["detail"],
        img: doc["img"],
        dId: doc["dId"],
        requestStatus: doc["requestStatus"],
        isRequstSend: doc["isRequstSend"],
        createdDate: Utils.toDateTime(doc['createdDate']),
      );
    }).toList();
  }

  Doctor _getsingleDoctor(DocumentSnapshot doc) {
    return Doctor(
      fullName: doc["fullName"],
      gender: doc["gender"],
      expriance: doc["expriance"],
      rate: doc["rate"],
      focus: doc["focus"],
      detail: doc["detail"],
      img: doc["img"],
      dId: doc["dId"],
      requestStatus: doc["requestStatus"],
      isRequstSend: doc["isRequstSend"],
      createdDate: Utils.toDateTime(doc['createdDate']),
    );
  }

  // String id = "dNxllvTQJ9P4YK1NgojD";
  Stream<Doctor> getsingleDoctor(String id) =>
      (doctorCollection.doc(id).snapshots().map(_getsingleDoctor));
  // String id = "dNxllvTQJ9P4YK1NgojD";
  Stream<List<Doctor>> getdoctor() =>
      doctorCollection.snapshots().map(_getDoctor);
}
