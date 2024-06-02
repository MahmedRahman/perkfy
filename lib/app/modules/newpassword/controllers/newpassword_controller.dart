import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.api.dart';

class NewpasswordController extends GetxController with StateMixin {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    change(null, status: RxStatus.success());

    print(Get.arguments.toString());
    super.onInit();
  }

  void disposeControllers() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }

  bool isPasswordStrong(String password) {
    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\$@\$!%*?&])[A-Za-z\d\$@\$!%*?&]{8,}';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  void forgetPasswordConfirmation({
    required String newPassword,
  }) async {
    change(null, status: RxStatus.loading());

    try {
      ResponseModel responseModel = await WebServices().forgotPasswordConfirmation(
        phoneNumber: Get.arguments[1],
        newPassword: newPassword,
        otp: Get.arguments[0],
      );

      // if (responseModel.data["success"] == false) {

      // }

      Get.snackbar("Done ", "${responseModel.data["message"].toString()}");
      Get.offAndToNamed(Routes.SIGNIN);
      change(null, status: RxStatus.success());
    } catch (e) {
      Get.snackbar("Done ", "${e.toString()}");
      change(null, status: RxStatus.success());

      return;
      //change(e.toString(), status: RxStatus.error());
    }
  }
}
