import 'package:healTalkpatient/index.dart';

class MessagehistoryField {
  static final String createdAt = 'createdAt';
}

class MessageHistory {
  final String ownerId;
  final String uId;
  final String urlAvatar;
  final String name;
  final String message;
  final DateTime createdAt;

  MessageHistory({
    this.ownerId,
    this.uId,
    this.urlAvatar,
    this.name,
    this.message,
    this.createdAt,
  });

  static MessageHistory fromJson(Map<String, dynamic> json) => MessageHistory(
      ownerId: json["ownerId"],
      uId: json['uId'],
      urlAvatar: json['urlAvatar'],
      name: json['name'],
      message: json['message'],
      createdAt: Utils.toDateTime(json['createdAt']));

  Map<String, dynamic> toJson() => {
        'ownerId': ownerId,
        'uId': uId,
        'urlAvatar': urlAvatar,
        'name': name,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt),
      };
}
