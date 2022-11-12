import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../locator/locator.dart';
import '../../../services/api_calling_service/user_api_calling_service/user_register_api_calling_service.dart';
import '../../../services/auth_service/auth_service.dart';
import '../home_view/bottam_navigaton_view.dart';

class SingUpViewModal extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;

  AuthService authService = locator<AuthService>();
  UserRegisterApiCallingServices userApiCallingServices =
      locator<UserRegisterApiCallingServices>();

  singUpAuth() async {
    EasyLoading.show(status: 'Loading...');
    try {
      UserCredential userCredential = await authService.singUp(
          email: email.value.trim(), password: password.value.trim());
      await userApiCallingServices.userRegister(userCredential);
      EasyLoading.dismiss();
      Get.snackbar("Sing Up Registered successfully..", "",
          snackPosition: SnackPosition.BOTTOM);
      Get.off(const BottamNavigatonView());
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'weak-password') {
        Get.snackbar("Weak Password..", "",
            snackPosition: SnackPosition.BOTTOM);
      }
      if (e.code == 'email-already-in-use') {
        Get.snackbar("This Email already use..", "",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      EasyLoading.dismiss();
      Get.snackbar("$error", "", snackPosition: SnackPosition.BOTTOM);
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
