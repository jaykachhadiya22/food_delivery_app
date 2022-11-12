import 'package:get_it/get_it.dart';
import 'package:state_hotel_project/services/hive_data_service/hive_data_service.dart';
import 'package:state_hotel_project/services/payment_service/payment_service.dart';
import '../services/api_calling_service/category_api_calling_service/category_api_calling_service.dart';
import '../services/api_calling_service/coupon_api_calling_service/coupon_api_calling_service.dart';
import '../services/api_calling_service/product_api_calling_service/product_api_calling_service.dart';
import '../services/api_calling_service/search_api_call_services/search_api_call_services.dart';
import '../services/api_calling_service/user_api_calling_service/get_user_profile_api_calling_service.dart';
import '../services/api_calling_service/user_api_calling_service/update_user_profile_service.dart';
import '../services/api_calling_service/user_api_calling_service/user_register_api_calling_service.dart';
import '../services/auth_service/auth_service.dart';
import '../services/firebase_storage_services/firebase_storage_services.dart';
import '../services/get_current_user_services/get_current_user_services.dart';

final locator = GetIt.instance;

void setup() {

  //Login service
  locator.registerLazySingleton<AuthService>(() => AuthService());

  //Hive service
  locator.registerLazySingleton<HiveDataService>(() => HiveDataService());

  //payment service
  locator.registerLazySingleton<PaymentService>(() => PaymentService());
  //firebase storage service
  locator.registerLazySingleton<FirebaseStorageServices>(() => FirebaseStorageServices());

  //firebase get current user
  locator.registerLazySingleton<GetCurrentUserServices>(() => GetCurrentUserServices());

  //api service
  locator.registerLazySingleton<CategoryApiCallingService>(
      () => CategoryApiCallingService());
  locator.registerLazySingleton<ProductApiCallingService>(
      () => ProductApiCallingService());
  locator.registerLazySingleton<CouponApiCallingService>(
      () => CouponApiCallingService());
  locator.registerLazySingleton<UserRegisterApiCallingServices>(
          () => UserRegisterApiCallingServices());
  locator.registerLazySingleton<GetUserProfileApiCallingService>(
          () => GetUserProfileApiCallingService());

  locator.registerLazySingleton<UpdateUserProfileService>(
          () => UpdateUserProfileService());

  //search service


  locator.registerLazySingleton<SearchApiCallServices>(
          () => SearchApiCallServices());
}
