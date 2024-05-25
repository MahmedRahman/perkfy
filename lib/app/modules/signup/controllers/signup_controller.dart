import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/service.auth.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.api.dart';

class SignupController extends GetxController with StateMixin {
  bool terms = false;
  bool sendEmail = false;
  String selectDate = "";
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    // TODO: implement onInit
    super.onInit();
  }

  void signUp({
    required String name,
    required String email,
    required String password,
    required String birthday,
    required String phoneNumber,
    required String sendEmail,
  }) async {
    change(null, status: RxStatus.loading());
    try {
      ResponseModel responseModel = await WebServices().signUp(
        name: name,
        email: email,
        password: password,
        birthday: birthday,
        phoneNumber: phoneNumber,
        sendEmail: sendEmail,
      );

      Get.snackbar("Done ", "${responseModel.data["data"].toString()}");

      ResponseModel responseLogin = await WebServices().loginWithPhone(
        email: email,
        password: password,
      );

      Get.find<AuthService>().token = responseLogin.data["message"];
      Get.find<AuthService>().IsLogged = true;
      Get.find<AuthService>().user = responseLogin.data["data"];

      Get.toNamed(Routes.OTPCODE, arguments: [responseModel.data["data"].toString()]);

      change("", status: RxStatus.success());
    } catch (e) {
      terms = true;

      Get.snackbar(
        "Bad argument",
        e.toString(),
        backgroundColor: Colors.red.shade300,
      );

      change(e.toString(), status: RxStatus.success());
    }
  }
}
