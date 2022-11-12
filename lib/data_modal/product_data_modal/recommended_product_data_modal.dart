// To parse this JSON data, do
//
//     final recommendedProductDataModal = recommendedProductDataModalFromJson(jsonString);

import 'dart:convert';

RecommendedProductDataModal recommendedProductDataModalFromJson(String str) => RecommendedProductDataModal.fromJson(json.decode(str));

String recommendedProductDataModalToJson(RecommendedProductDataModal data) => json.encode(data.toJson());

class RecommendedProductDataModal {
  RecommendedProductDataModal({
    required this.status,
    required this.data,
  });

  int status;
  List<Product> data;

  factory RecommendedProductDataModal.fromJson(Map<String, dynamic> json) => RecommendedProductDataModal(
    status: json["status"],
    data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Product {
  Product({
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
  String restaurantId;
  List<Varient> varients;
  double rating;
  bool recommended;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    productName: json["product_name"],
    image: json["image"],
    productDesc: json["product_desc"],
    categoryId: json["categoryId"],
    restaurantId: json["restaurantId"],
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
    "restaurantId": restaurantId,
    "varients": List<dynamic>.from(varients.map((x) => x.toJson())),
    "rating": rating,
    "recommended": recommended,
  };
}

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
