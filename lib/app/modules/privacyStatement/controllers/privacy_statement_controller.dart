import 'package:get/get.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.api.dart';

class PrivacyStatementController extends GetxController with StateMixin {
  @override
  void onInit() {
    getPrivacyStatement();
    super.onInit();
  }

  void getPrivacyStatement() async {
    change(null, status: RxStatus.loading());
    try {
      ResponseModel responseModel = await WebServices().getPrivacyStatement();
      change(
        responseModel.data["data"],
        status: RxStatus.success(),
      );
    } catch (e) {
      change(
        e.toString(),
        status: RxStatus.error(),
      );
    }
  }
}
