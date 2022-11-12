import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:state_hotel_project/data_modal/user_data_modal/update_user_profile_data_modal.dart';
import '../../../data_modal/user_data_modal/add_user_address_data_modal.dart';

class UpdateUserProfileService {
  updateUserProfile(String userId, String name, String email, int phoneNumber,
      String userImage) async {
    Dio dio = Dio();
    UpdateUserData userData = UpdateUserData(
        userId: userId,
        name: name,
        email: email,
        phone: phoneNumber,
        userImg: userImage);
    const String pathUrl =
        'https://seemflow-food-delivery.herokuapp.com/user/update';
    Response response = await dio.post(
      pathUrl,
      data: userData.toJson(),
    );
  }

  addUserAddress(String userId, String type, String houseNo, String locality,
      String city, String state, String pinCode) async {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true));
    AddAddress userData = AddAddress(
        userId: userId,
        type: type,
        line: houseNo,
        locality: locality,
        city: city,
        state: state,
        pinCode: pinCode);
    const String pathUrl =
        'https://seemflow-food-delivery.herokuapp.com/user/address/add';
    Response response = await dio.post(
      pathUrl,
      data: userData.toJson(),
      options: Options(
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      ),
    );
    print(response);
  }

  updateUserAddress(String userId, String addId, String type, String houseNo,
      String locality, String city, String state, String pinCode) async {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true));
    UpdateAddress userData = UpdateAddress(
        userId: userId,
        add_id: addId,
        type: type,
        line: houseNo,
        locality: locality,
        city: city,
        state: state,
        pinCode: pinCode);
    const String pathUrl =
        'https://seemflow-food-delivery.herokuapp.com/user/address/update';
    Response response = await dio.post(
      pathUrl,
      data: userData.toJson(),
      options: Options(
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      ),
    );
  }

  deleteUserAddress(String userId, String addressId) async {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true));
    String pathUrl =
        'https://seemflow-food-delivery.herokuapp.com/user/address/remove?userId=$userId&addressId=$addressId';
    try {
      await dio.delete(pathUrl);
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
