
import 'dart:convert';

AddUserAddressDataModal addUserAddressDataModalFromJson(String str) => AddUserAddressDataModal.fromJson(json.decode(str));

String addUserAddressDataModalToJson(AddUserAddressDataModal data) => json.encode(data.toJson());

class AddUserAddressDataModal {
  AddUserAddressDataModal({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  AddUserAddress data;

  factory AddUserAddressDataModal.fromJson(Map<String, dynamic> json) => AddUserAddressDataModal(
    status: json["status"],
    message: json["message"],
    data: AddUserAddress.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class AddUserAddress {
  AddUserAddress({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,

  });

  String name;
  String email;
  int phone;
  String address;


  factory AddUserAddress.fromJson(Map<String, dynamic> json) => AddUserAddress(

    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address:json["address"],
  );

  Map<String, dynamic> toJson() => {

    "name": name,
    "email": email,
    "phone": phone,
    "address":address,

  };
}

class UpdateAddress {
  UpdateAddress({
    required this.userId,
    required this.add_id,
    required this.type,
    required this.line,
    required this.locality,
    required this.city,
    required this.state,
    required this.pinCode,
  });
  String userId;
  String add_id;
  String type;
  String line;
  String locality;
  String city;
  String state;
  String pinCode;

  factory UpdateAddress.fromJson(Map<String, dynamic> json) => UpdateAddress(
    userId: json["userId"],
    add_id: json["addressId"],
    type: json["type"],
    line: json["line"],
    locality: json["locality"],
    city: json["city"],
    state: json["state"],
    pinCode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "addressId":add_id,
    "type": type,
    "line": line,
    "locality": locality,
    "city": city,
    "state": state,
    "pincode": pinCode,
  };
}

class AddAddress {
  AddAddress({
    required this.userId,
    required this.type,
    required this.line,
    required this.locality,
    required this.city,
    required this.state,
    required this.pinCode,
  });
  String userId;
  String type;
  String line;
  String locality;
  String city;
  String state;
  String pinCode;

  factory AddAddress.fromJson(Map<String, dynamic> json) => AddAddress(
    userId: json["userId"],
    type: json["type"],
    line: json["line"],
    locality: json["locality"],
    city: json["city"],
    state: json["state"],
    pinCode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "type": type,
    "line": line,
    "locality": locality,
    "city": city,
    "state": state,
    "pincode": pinCode,
  };
}

