import 'dart:convert';

AddNotificationTokenDataModal addNotificationTokenDataModalFromJson(
        String str) =>
    AddNotificationTokenDataModal.fromJson(json.decode(str));

String addNotificationTokenDataModalToJson(
        AddNotificationTokenDataModal data) =>
    json.encode(data.toJson());

class AddNotificationTokenDataModal {
  AddNotificationTokenDataModal({
    required this.status,
    required this.msg,
    required this.data,
  });

  int status;
  String msg;
  NotificationData data;

  factory AddNotificationTokenDataModal.fromJson(Map<String, dynamic> json) =>
      AddNotificationTokenDataModal(
        status: json["status"],
        msg: json["msg"],
        data: NotificationData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class NotificationData {
  NotificationData({
    required this.userId,
    required this.notificationToken,
  });

  String userId;
  String notificationToken;

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
        userId: json["userId"],
        notificationToken:
            json["notification_token"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "notification_token":notificationToken,
      };
}
