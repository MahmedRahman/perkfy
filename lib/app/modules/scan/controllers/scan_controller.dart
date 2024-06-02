import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/service.auth.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.dart';

class ScanController extends GetxController with StateMixin {
  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future getUserInfo() async {
    try {
      ResponseModel responseModel = await WebServices().getuserInfoById(
        id: Get.find<AuthService>().user["id"].toString(),
      );
      Get.find<AuthService>().user = responseModel.data["data"];
    } catch (e) {
      change(e, status: RxStatus.error());
    }
  }

  void AddDycrypted({required String encryptedString}) async {
    change(null, status: RxStatus.loading());
    try {
      ResponseModel responseModel = await WebServices().addDycrypted(encryptedString: encryptedString);
      if (responseModel.data["success"] == false) {
        Get.snackbar(
          "Error",
          responseModel.data["message"],
        );
        change(null, status: RxStatus.success());
        return;
      }
      Get.snackbar("Done", responseModel.data["message"], backgroundColor: Colors.amber);
      change(null, status: RxStatus.success());
      await getUserInfo();
      Get.toNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar(
        "Error in scanning",
        "Kindly scan again",
        backgroundColor: Colors.red,
      );
      change(null, status: RxStatus.success());
    }
  }
}
