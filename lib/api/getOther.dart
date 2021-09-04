import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healTalkpatient/index.dart';
import 'package:path/path.dart';

class OtherApi {
  final _auth = FirebaseAuth.instance;
  static final refOthers = FirebaseFirestore.instance.collection('Others');
  static final doctorCollection =
      FirebaseFirestore.instance.collection('Other');

  Future sendOther(bool isclear, String acceptedDoctorID) async {
    final newOther = Other(
      acceptedDoctorID: acceptedDoctorID,
      patientId: _auth.currentUser.uid,
      isclear: isclear,
    );
    await refOthers.doc(_auth.currentUser.uid).set(newOther.toJson());
  }

  //get Other

  Other _getOther(DocumentSnapshot snapshot) {
    // print("Other");
    // print(snapshot);
    return Other(
      acceptedDoctorID: snapshot["acceptedDoctorID"],
      patientId: snapshot['patientId'],
      isclear: snapshot['isclear'],
    );
  }

  Stream<Other> get getOters =>
      refOthers.doc(_auth.currentUser.uid).snapshots().map(_getOther);
}
