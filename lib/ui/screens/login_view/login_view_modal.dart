import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:state_hotel_project/locator/locator.dart';
import '../../../services/api_calling_service/user_api_calling_service/user_register_api_calling_service.dart';
import '../../../services/auth_service/auth_service.dart';
import '../home_view/bottam_navigaton_view.dart';


class LoginViewModal extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;
  RxInt c = 0.obs;
  AuthService authService = locator<AuthService>();
  UserRegisterApiCallingServices userApiCallingServices = locator<UserRegisterApiCallingServices>();
  loginAuth() async {
    EasyLoading.show(status: 'Loading...');
    UserCredential userCredential;
      try {
         userCredential= await authService.login(
            email: email.value.trim(), password: password.value.trim());
        await userApiCallingServices.addNotificationTokenUserLogin(userCredential);
        EasyLoading.dismiss();
        Get.snackbar("Login successfully..", "",
            snackPosition: SnackPosition.BOTTOM);
        Get.off(const BottamNavigatonView());
      } on FirebaseAuthException catch (e) {
        EasyLoading.dismiss();
        if (e.code == 'user-not-found') {
          Get.snackbar("No User Found", "",
              snackPosition: SnackPosition.BOTTOM);
        }
        if (e.code == 'wrong-password') {
          Get.snackbar("Wong Password..", "",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (error) {
        EasyLoading.dismiss();
        Get.snackbar("$error", "", snackPosition: SnackPosition.BOTTOM);

        print(error);
      }

  }

  emailValidation() {
    final bool isValid = EmailValidator.validate(email.value.trim());
    if (isValid) {
      return true;
    } else {
      Get.snackbar("Enter Valid Email...", "",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
