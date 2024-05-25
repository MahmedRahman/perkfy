import 'package:get/get.dart';

import '../controllers/rewards_detail_controller.dart';

class RewardsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardsDetailController>(
      () => RewardsDetailController(),
    );
  }
}
