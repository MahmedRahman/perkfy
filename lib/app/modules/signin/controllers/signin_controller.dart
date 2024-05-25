import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/service.auth.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.dart';

class SigninController extends GetxController with StateMixin {
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void loginWithPhone({required String phone, required String password}) async {
    change(null, status: RxStatus.loading());
    try {
      ResponseModel responseModel = await WebServices().loginWithPhone(
        email: phone,
        password: password,
      );

      Get.find<AuthService>().token = responseModel.data["message"];
      Get.find<AuthService>().IsLogged = true;
      Get.find<AuthService>().user = responseModel.data["data"];
      Get.offAndToNamed(Routes.HOME);
      change(null, status: RxStatus.success());
    } catch (e) {
      Get.snackbar("Done", e.toString());

      change(null, status: RxStatus.success());
    }
  }
}
