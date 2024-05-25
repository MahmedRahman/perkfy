import 'package:get/get.dart';
import 'package:perkfy/web_serives/exception.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.api.dart';

class RewardsDetailController extends GetxController with StateMixin {
  @override
  void onInit() {
    // TODO: implement onInit
    change(Get.arguments, status: RxStatus.success());
    // getRewardById(rewardId:);
    super.onInit();
  }

  void getRewardById({required String rewardId}) async {
    try {
      ResponseModel responseModel = await WebServices().getRewardById(rewardId: rewardId);

      change(responseModel.data["data"], status: RxStatus.success());
    } on EmptyDataException {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(e.toString(), status: RxStatus.error());
    }
  }
}
