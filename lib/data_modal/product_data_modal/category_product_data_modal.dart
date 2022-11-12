// To parse this JSON data, do
//
//     final categoryProductDataModal = categoryProductDataModalFromJson(jsonString);

import 'dart:convert';

CategoryProductDataModal categoryProductDataModalFromJson(String str) => CategoryProductDataModal.fromJson(json.decode(str));

String categoryProductDataModalToJson(CategoryProductDataModal data) => json.encode(data.toJson());

class CategoryProductDataModal {
  CategoryProductDataModal({
    required this.status,
    required this.data,
  });

  int status;
  List<CategoryProduct> data;

  factory CategoryProductDataModal.fromJson(Map<String, dynamic> json) => CategoryProductDataModal(
    status: json["status"],
    data: List<CategoryProduct>.from(json["data"].map((x) => CategoryProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoryProduct {
  CategoryProduct({
    required this.id,
    required this.productName,
    required this.image,
    required this.productDesc,
    required this.categoryId,
    required this.restaurantId,
    required this.varients,
    required this.rating,
    required  this.recommended,
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

  factory CategoryProduct.fromJson(Map<String, dynamic> json) => CategoryProduct(
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

  });

  String size;
  int price;


  factory Varient.fromJson(Map<String, dynamic> json) => Varient(
    size: json["size"],
    price: json["price"],

  );

  Map<String, dynamic> toJson() => {
    "size": size,
    "price": price,
  };
}


