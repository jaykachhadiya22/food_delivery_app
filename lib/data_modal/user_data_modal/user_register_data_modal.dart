
import 'dart:convert';

UserRegisterDataModal userRegisterDataModalFromJson(String str) => UserRegisterDataModal.fromJson(json.decode(str));

String userRegisterDataModalToJson(UserRegisterDataModal data) => json.encode(data.toJson());

class UserRegisterDataModal {
  UserRegisterDataModal({
    required this.status,
    required this.msg,
    required this.data,
  });

  int status;
  String msg;
  UserData data;

  factory UserRegisterDataModal.fromJson(Map<String, dynamic> json) => UserRegisterDataModal(
    status: json["status"],
    msg: json["msg"],
    data: UserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data.toJson(),
  };
}

class UserData {
  UserData({
    required this.userId,
    required this.email,
    required this.notificationToken,

  });

  String userId;
  String email;
  String notificationToken;


  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    userId: json["userId"],
    email: json["email"],
    notificationToken: json["notification_token"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "email": email,
    "notification_token": notificationToken,

  };
}

class Wallet {
  Wallet({
    required this.balance,
  });

  int balance;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
  };
}
