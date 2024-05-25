import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.dart';

class ScanController extends GetxController with StateMixin {
  @override
  void onInit() {
    getSetting();
    // TODO: implement onInit
    super.onInit();
  }

  void getSetting() async {
    try {
      ResponseModel responseModel = await WebServices().getPointSetting();
      change(responseModel.data["data"], status: RxStatus.success());
    } catch (e) {
      change(e, status: RxStatus.error());
    }
  }

  void AddDycrypted({required String encryptedString}) async {
    ResponseModel responseModel = await WebServices().addDycrypted(encryptedString: encryptedString);
    if (responseModel.data["success"] == false) {
      Get.snackbar(
        "Error",
        responseModel.data["message"],
      );
      return;
    }
    Get.snackbar("Done", responseModel.data["message"]);
    Get.toNamed(Routes.HOME);
  }
}
