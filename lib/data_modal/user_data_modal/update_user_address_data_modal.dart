// To parse this JSON data, do
//
//     final updateUserAddressDataModal = updateUserAddressDataModalFromJson(jsonString);

import 'dart:convert';

UpdateUserAddressDataModal updateUserAddressDataModalFromJson(String str) =>
    UpdateUserAddressDataModal.fromJson(json.decode(str));

String updateUserAddressDataModalToJson(UpdateUserAddressDataModal data) =>
    json.encode(data.toJson());

class UpdateUserAddressDataModal {
  UpdateUserAddressDataModal({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory UpdateUserAddressDataModal.fromJson(Map<String, dynamic> json) =>
      UpdateUserAddressDataModal(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}

class UpdateAddress {
  UpdateAddress({
    required this.userId,
    required this.type,
    required this.line,
    required this.locality,
    required this.city,
    required this.state,
    required this.pincode,
  });

  int userId;
  String type;
  String line;
  String locality;
  String city;
  String state;
  String pincode;

  factory UpdateAddress.fromJson(Map<String, dynamic> json) => UpdateAddress(
        userId: json["userId"],
        type: json["type"],
        line: json["line"],
        locality: json["locality"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "type": type,
        "line": line,
        "locality": locality,
        "city": city,
        "state": state,
        "pincode": pincode,
      };
}
