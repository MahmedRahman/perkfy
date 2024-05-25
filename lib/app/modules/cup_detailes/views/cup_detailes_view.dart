import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cup_detailes_controller.dart';

class CupDetailesView extends GetView<CupDetailesController> {
  const CupDetailesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return controller.obx((snapshot) {
      return Scaffold(
        appBar: AppBar(
          title: Text("${snapshot[0]["title"].toString()}"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text(snapshot[0]["title"].toString()),
          ],
        ),
      );
    });
  }
}
