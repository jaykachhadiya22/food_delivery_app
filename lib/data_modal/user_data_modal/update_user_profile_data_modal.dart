
import 'dart:convert';

UpdateUserProfileDataModal updateUserProfileDataModalFromJson(String str) =>
    UpdateUserProfileDataModal.fromJson(json.decode(str));

String updateUserProfileDataModalToJson(UpdateUserProfileDataModal data) =>
    json.encode(data.toJson());

class UpdateUserProfileDataModal {
  UpdateUserProfileDataModal({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  UpdateUserData data;

  factory UpdateUserProfileDataModal.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfileDataModal(
        status: json["status"],
        message: json["message"],
        data: UpdateUserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class UpdateUserData {
  UpdateUserData({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.userImg,
  });

  String userId;
  String name;
  String email;
  int phone;
  String userImg;

  factory UpdateUserData.fromJson(Map<String, dynamic> json) => UpdateUserData(
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        userImg: json["userImg"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "email": email,
        "phone": phone,
        "userImg": userImg,
      };
}
