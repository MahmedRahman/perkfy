import 'package:get/get.dart';

import '../controllers/rewards_claim_controller.dart';

class RewardsClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardsClaimController>(
      () => RewardsClaimController(),
    );
  }
}
