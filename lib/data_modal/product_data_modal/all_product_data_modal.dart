// To parse this JSON data, do
//
//     final allProductDataModal = allProductDataModalFromJson(jsonString);

import 'dart:convert';

AllProductDataModal allProductDataModalFromJson(String str) => AllProductDataModal.fromJson(json.decode(str));

String allProductDataModalToJson(AllProductDataModal data) => json.encode(data.toJson());

class AllProductDataModal {
  AllProductDataModal({
    required this.status,
    required this.data,
  });

  int status;
  List<AllProductDetail> data;

  factory AllProductDataModal.fromJson(Map<String, dynamic> json) => AllProductDataModal(
    status: json["status"],
    data: List<AllProductDetail>.from(json["data"].map((x) => AllProductDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AllProductDetail {
  AllProductDetail({
    required this.id,
    required this.productName,
    required this.image,
    required this.productDesc,
    required this.categoryId,
    required this.restaurantId,
    required this.varients,
    required this.rating,
    required this.recommended,
  });

  String id;
  String productName;
  String image;
  String productDesc;
  String categoryId;
  RestaurantId? restaurantId;
  List<Varient> varients;
  double rating;
  bool recommended;

  factory AllProductDetail.fromJson(Map<String, dynamic> json) => AllProductDetail(
    id: json["_id"],
    productName: json["product_name"],
    image: json["image"],
    productDesc: json["product_desc"],
    categoryId: json["categoryId"],
    restaurantId: restaurantIdValues.map[json["restaurantId"]],
    varients: List<Varient>.from(json["varients"].map((x) => Varient.fromJson(x))),
    rating: json["rating"].toDouble(),
    recommended: json["recommended"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "product_name": productName,
    "image": image,
    "product_desc": productDesc,
    "categoryId": categoryId,
    "restaurantId": restaurantIdValues.reverse![restaurantId],
    "varients": List<dynamic>.from(varients.map((x) => x.toJson())),
    "rating": rating,
    "recommended": recommended,
  };
}

enum RestaurantId { THE_62_F0_EEC4_C3_EB4352_F357_FFC5, THE_62_F61168_ECDC4_E538_EECFF9_D, THE_62_F61086_ECDC4_E538_EECFF98, THE_62_F6119_D914_EF9_A3_D526_FF3_B }

final restaurantIdValues = EnumValues({
  "62f0eec4c3eb4352f357ffc5": RestaurantId.THE_62_F0_EEC4_C3_EB4352_F357_FFC5,
  "62f61086ecdc4e538eecff98": RestaurantId.THE_62_F61086_ECDC4_E538_EECFF98,
  "62f61168ecdc4e538eecff9d": RestaurantId.THE_62_F61168_ECDC4_E538_EECFF9_D,
  "62f6119d914ef9a3d526ff3b": RestaurantId.THE_62_F6119_D914_EF9_A3_D526_FF3_B
});

class Varient {
  Varient({
    required this.size,
    required this.price,
    required this.extra,
  });

  Size? size;
  int price;
  List<Extra>? extra;

  factory Varient.fromJson(Map<String, dynamic> json) => Varient(
    size: sizeValues.map[json["size"]],
    price: json["price"],
    extra: json["extra"] == null ? null : List<Extra>.from(json["extra"].map((x) => Extra.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "size": sizeValues.reverse![size],
    "price": price,
    "extra": extra == null ? null : List<dynamic>.from(extra!.map((x) => x.toJson())),
  };
}

class Extra {
  Extra({
    required this.name,
    required this.rate,
  });

  String name;
  int rate;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
    name: json["name"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "rate": rate,
  };
}

enum Size { SMALL, MEDIUM, LARGE }

final sizeValues = EnumValues({
  "large": Size.LARGE,
  "medium": Size.MEDIUM,
  "small": Size.SMALL
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
