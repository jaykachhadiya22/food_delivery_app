import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:state_hotel_project/data_modal/user_data_modal/get_user_profile_data_modal.dart';

class GetUserProfileApiCallingService {
  getUserProfile(String userId) async {
    GetUserProfileDataModal? dataModel;
    try {
      Dio _dio = Dio();
      _dio.options.responseType = ResponseType.plain;
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true));
      Response response = await _dio.get(
          'https://seemflow-food-delivery.herokuapp.com/user?userId=$userId');
      dataModel = getUserProfileDataModalFromJson(response.data);
    } catch (e) {
      print("" + e.toString());
    }

    return dataModel?.data;
  }
}
