import 'package:healTalkpatient/index.dart';

class DoctorField {
  static final String createdDate = 'createdDate';
}

class Doctor {
  final String fullName;
  final String gender;
  final String expriance;
  final String rate;
  final String focus;
  final String detail;
  final String dId;
  final String img;
  final DateTime createdDate;
  final bool requestStatus;
  final bool isRequstSend;
  Doctor(
      {this.fullName,
      this.gender,
      this.expriance,
      this.rate,
      this.focus,
      this.detail,
      this.img,
      this.dId,
      this.requestStatus,
      this.isRequstSend,
      this.createdDate});

  fromJson(Map<String, dynamic> json) => Doctor(
        fullName: json["fullName"],
        gender: json["gender"],
        expriance: json["expriance"],
        rate: json["rate"],
        focus: json["focus"],
        detail: json["detail"],
        img: json["img"],
        dId: json["dId"],
        requestStatus: json["requestStatus"],
        isRequstSend: json["isRequstSend"],
        createdDate: Utils.toDateTime(json['createdDate']),
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "gender": gender,
        "expriance": expriance,
        "rate": rate,
        "focus": focus,
        "detail": detail,
        "img": img,
        "dId": dId,
        "requestStatus": requestStatus,
        'createdDate': Utils.fromDateTimeToJson(createdDate),
      };
}
