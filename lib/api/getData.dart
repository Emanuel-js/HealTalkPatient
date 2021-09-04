import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healTalkpatient/index.dart';

class DoctorData {
  final CollectionReference doctorCollection =
      FirebaseFirestore.instance.collection('Doctor');

  List<Doctor> _getDoctor(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print('doctor data---');
      print(doc.data());
      return Doctor(
          fullName: doc["fullName"],
          gender: doc["gender"],
          expriance: doc["expriance"],
          rate: doc["rate"],
          focus: doc["focus"],
          detail: doc["detail"],
          img: doc["img"],
          dId: doc["dId"],
          cv: doc["cv"],
          email: doc["email"],
          licence: doc["licence"],
          address: doc["address"],
          phone: doc["phone"],
          nameTitle: doc["nameTitle"],
          isactive: doc["isactive"],
          dob: Utils.toDateTime(doc["dob"]),
          requtSender: doc["requtSender"],
          createdDate: Utils.toDateTime(doc['createdDate']));
    }).toList();
  }

  Doctor _getsingleDoctor(DocumentSnapshot doc) {
    return Doctor().fromJson(doc.data());
  }

  // String id = "dNxllvTQJ9P4YK1NgojD";
  Stream<Doctor> getsingleDoctor(String id) =>
      (doctorCollection.doc(id).snapshots().map(_getsingleDoctor));
  // String id = "dNxllvTQJ9P4YK1NgojD";
  Stream<List<Doctor>> get getdoctor =>
      doctorCollection.snapshots().map(_getDoctor);
}
