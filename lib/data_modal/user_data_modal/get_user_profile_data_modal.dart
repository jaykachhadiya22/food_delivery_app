import 'dart:convert';

GetUserProfileDataModal getUserProfileDataModalFromJson(String str) =>
    GetUserProfileDataModal.fromJson(json.decode(str));

String getUserProfileDataModalToJson(GetUserProfileDataModal data) =>
    json.encode(data.toJson());

class GetUserProfileDataModal {
  GetUserProfileDataModal({
    required this.status,
    required this.data,
  });

  int status;
  GetUserData data;

  factory GetUserProfileDataModal.fromJson(Map<String, dynamic> json) =>
      GetUserProfileDataModal(
        status: json["status"],
        data: GetUserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class GetUserData {
  GetUserData({

    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.userImg,
    required this.address,
    required this.notificationToken,
  });


  String? id;
  String? name;
  String? email;
  int? phone;
  String? userImg;
  List<dynamic>? address;
  List<String>? notificationToken;

  factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(

        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        userImg: json["userImg"],
        address: List<dynamic>.from(json["address"].map((x) => x)),
        notificationToken:
            List<String>.from(json["notificationToken"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {

        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "userImg": userImg,
        "address": List<dynamic>.from(address!.map((x) => x)),
        "notificationToken":
            List<dynamic>.from(notificationToken!.map((x) => x)),
      };
}

