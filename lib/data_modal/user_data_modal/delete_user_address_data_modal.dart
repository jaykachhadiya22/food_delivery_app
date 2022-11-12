import 'dart:convert';

DeleteUserAddressDataModal deleteUserAddressDataModalFromJson(String str) =>
    DeleteUserAddressDataModal.fromJson(json.decode(str));

String deleteUserAddressDataModalToJson(DeleteUserAddressDataModal data) =>
    json.encode(data.toJson());

class DeleteUserAddressDataModal {
  DeleteUserAddressDataModal({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory DeleteUserAddressDataModal.fromJson(Map<String, dynamic> json) =>
      DeleteUserAddressDataModal(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}

class DeleteUserAddress {
  DeleteUserAddress({
    required this.userId,
    required this.type,
  });

  String userId;
  String type;

  factory DeleteUserAddress.fromJson(Map<String, dynamic> json) =>
      DeleteUserAddress(
        userId: json["userId"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "type": type,
      };
}
