import 'package:get/get.dart';
import 'package:perkfy/shared/service.auth.dart';
import 'package:perkfy/web_serives/exception.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.api.dart';

class RewardsController extends GetxController with StateMixin {
  @override
  void onInit() {
    getRewards();
    super.onInit();
  }

  void getRewards() async {
    try {
      ResponseModel responseModel = await WebServices().getRewards();
      change(responseModel.data["data"], status: RxStatus.success());
    } on EmptyDataException {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(e.toString(), status: RxStatus.error());
    }
  }
}
