import 'package:get/get.dart';

import '../controllers/cup_detailes_controller.dart';

class CupDetailesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CupDetailesController>(
      () => CupDetailesController(),
    );
  }
}
