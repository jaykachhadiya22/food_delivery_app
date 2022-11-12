import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../data_modal/user_data_modal/add_notification_token_data_modal.dart';
import '../../../data_modal/user_data_modal/user_register_data_modal.dart';

class UserRegisterApiCallingServices {
  userRegister(UserCredential userCredential) async {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true));
    UserData userData = UserData(
        userId: userCredential.user!.uid,
        email: userCredential.user!.email.toString(),
        notificationToken: "123456789");
    const String pathUrl =
        'https://seemflow-food-delivery.herokuapp.com/register';
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

  addNotificationTokenUserLogin(UserCredential userCredential) async {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true));
    NotificationData userNotificationTokenData = NotificationData(
        userId: userCredential.user!.uid,
        notificationToken: "123456789");
    const String pathUrl =
        'https://seemflow-food-delivery.herokuapp.com/user/notificationToken';
    Response response = await dio.post(
      pathUrl,
      data: userNotificationTokenData.toJson(),
      options: Options(
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      ),
    );
  }
}
