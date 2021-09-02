import 'package:healTalkpatient/index.dart';

// class RequestField {
//   static final String createdAt = 'createdAt';
// }

class Request {
  final DateTime timestamps;
  final bool state;
  final String reqOwnerId;
  final String reqReciverId;
  final bool isaccepted;

  Request(
      {this.timestamps,
      this.state,
      this.reqOwnerId,
      this.reqReciverId,
      this.isaccepted});

  static Request fromJson(Map<String, dynamic> json) => Request(
      timestamps: Utils.toDateTime(json['timestamps']),
      state: json["state"],
      reqOwnerId: json["reqOwnerId"],
      reqReciverId: json["reqReciverId"],
      isaccepted: json["isaccepted"]);

  Map<String, dynamic> toJson() => {
        'timestamps': Utils.fromDateTimeToJson(timestamps),
        'state': state,
        'reqOwnerId': reqOwnerId,
        'reqReciverId': reqReciverId,
        'isaccepted': isaccepted,
      };
}
