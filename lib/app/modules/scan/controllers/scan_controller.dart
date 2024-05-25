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
    await getSetting();
  }

  Future getSetting() async {
    try {
      ResponseModel responseModel = await WebServices().getPointSetting();
      change(responseModel.data["data"], status: RxStatus.success());
    } catch (e) {
      change(e, status: RxStatus.error());
    }
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
        getSetting();
        return;
      }
      Get.snackbar("Done", responseModel.data["message"], backgroundColor: Colors.amber);
      await getSetting();
      await getUserInfo();
      Get.toNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("decrypting", "An error occurred while decrypting the transaction data",
          backgroundColor: Colors.red);
      await getSetting();
    }
  }
}
