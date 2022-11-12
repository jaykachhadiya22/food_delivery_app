import 'dart:convert';

CataegoryDataModal cataegoryDataModalFromJson(String str) =>
    CataegoryDataModal.fromJson(json.decode(str));

String cataegoryDataModalToJson(CataegoryDataModal data) =>
    json.encode(data.toJson());

class CataegoryDataModal {
  CataegoryDataModal({
    required this.status,
    required this.data,
  });

  int status;
  List<Datum> data;

  factory CataegoryDataModal.fromJson(Map<String, dynamic> json) =>
      CataegoryDataModal(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.image,
    required this.restaurantId,
  });

  String id;
  String name;
  String image;
  String restaurantId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        restaurantId: json["restaurantId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "restaurantId": restaurantId,
      };
}
