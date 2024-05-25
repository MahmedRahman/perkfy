import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.api.dart';

class ForgetpasswordController extends GetxController with StateMixin {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change(null, status: RxStatus.success());
  }

  void forgetPassword({required String phoneNumber}) async {
    change(null, status: RxStatus.loading());
    try {
      ResponseModel responseModel = await WebServices().forgotPassword(
        phoneNumber: phoneNumber,
      );

      Get.snackbar("Done ", "${responseModel.data["data"].toString()}");
      Get.toNamed(Routes.OTPCODE, arguments: [responseModel.data["data"].toString(), phoneNumber]);
      change(null, status: RxStatus.success());
    } catch (e) {
      change(e.toString(), status: RxStatus.error());
    }
  }
}
