import 'package:dio/dio.dart';
import 'package:state_hotel_project/data_modal/coupon_data_modal/coupon_data_modal.dart';

class CouponApiCallingService {
  couponApiCalling() async {
    CouponDataModal? couponDataModal;
    try {
      Dio _dio = Dio();
      _dio.options.responseType = ResponseType.plain;
      Response response = await _dio.get(
          'https://seemflow-food-delivery.herokuapp.com/coupon/all');

       couponDataModal = couponDataModalFromJson(response.data);
    } catch (e) {
      print("" + e.toString());
    }
    return couponDataModal!.data;
  }
}
