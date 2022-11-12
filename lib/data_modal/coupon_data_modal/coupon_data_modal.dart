
import 'dart:convert';

CouponDataModal couponDataModalFromJson(String str) =>
    CouponDataModal.fromJson(json.decode(str));

String couponDataModalToJson(CouponDataModal data) =>
    json.encode(data.toJson());

class CouponDataModal {
  CouponDataModal({
    required this.status,
    required this.data,
  });

  int status;
  List<Coupon> data;

  factory CouponDataModal.fromJson(Map<String, dynamic> json) =>
      CouponDataModal(
        status: json["status"],
        data: List<Coupon>.from(json["data"].map((x) => Coupon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Coupon {
  Coupon({
    required this.detail,
    required this.validity,
    required this.id,
    required this.couponName,
    required this.couponDesc,
    required this.restaurantId,
    required this.minPurchase,
    required this.image,
  });

  Detail detail;
  Validity validity;
  String id;
  String couponName;
  String couponDesc;
  String restaurantId;
  int minPurchase;
  String image;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        detail: Detail.fromJson(json["detail"]),
        validity: Validity.fromJson(json["validity"]),
        id: json["_id"],
        couponName: json["coupon_name"],
        couponDesc: json["coupon_desc"],
        restaurantId: json["restaurantId"],
        minPurchase: json["minPurchase"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail.toJson(),
        "validity": validity.toJson(),
        "_id": id,
        "coupon_name": couponName,
        "coupon_desc": couponDesc,
        "restaurantId": restaurantId,
        "minPurchase": minPurchase,
        "image": image,
      };
}

class Detail {
  Detail({
    required this.discountType,
    required this.discount,
    required this.upto,
  });

  String discountType;
  int discount;
  int upto;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        discountType: json["discount_type"],
        discount: json["discount"],
        upto: json["upto"],
      );

  Map<String, dynamic> toJson() => {
        "discount_type": discountType,
        "discount": discount,
        "upto": upto,
      };
}

class Validity {
  Validity({
    required this.startDate,
    required this.expDate,
  });

  DateTime startDate;
  DateTime expDate;

  factory Validity.fromJson(Map<String, dynamic> json) => Validity(
        startDate: DateTime.parse(json["startDate"]),
        expDate: DateTime.parse(json["expDate"]),
      );

  Map<String, dynamic> toJson() => {
        "startDate": startDate.toIso8601String(),
        "expDate": expDate.toIso8601String(),
      };
}
