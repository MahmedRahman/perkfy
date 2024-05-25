import 'package:get/get.dart';

import '../controllers/privacy_statement_controller.dart';

class PrivacyStatementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyStatementController>(
      () => PrivacyStatementController(),
    );
  }
}
