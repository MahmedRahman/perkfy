import 'package:get/get.dart';

class CupDetailesController extends GetxController with StateMixin {
  void onInit() {
    // TODO: implement onInit
    change(Get.arguments, status: RxStatus.success());
    // getRewardById(rewardId:);
    super.onInit();
  }
}
