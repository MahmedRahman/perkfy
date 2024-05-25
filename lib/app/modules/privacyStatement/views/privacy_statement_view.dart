import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/privacy_statement_controller.dart';

class PrivacyStatementView extends GetView<PrivacyStatementController> {
  const PrivacyStatementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Statement'),
        centerTitle: true,
      ),
      body: controller.obx(
        (snapshot) {
          return Container();
        },
      ),
    );
  }
}
