import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/shared/component/custom_history_item.dart';
import 'package:perkfy/shared/string.dart';

import '../controllers/history_controller.dart';

// Divider(),
class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.getHistory();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          centerTitle: true,
        ),
        body: controller.obx(
          (snapshot) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: List.generate(snapshot.length, (index) {
                  return CustomHistoryItem(
                    title: (snapshot[index]["typeId"].toString() == "2") ? "Redeem Stars" : "Add Stars",
                    gainedStars: snapshot[index]["amount"].toString(),
                    usedPoints: snapshot[index]["amount"].toString(),
                    expiringPoints: "".toString(),
                    expiryDate: "".toString(), // Example expiry date
                    timestamp: snapshot[index]["transactionTime"].toString().toCustomDateFormat(), // Example timestamp
                  );
                }),
              ),
            );
          },
          onEmpty: Container(
            child: Center(
              child: Text(
                "No History Found",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          onError: (error) {
            return Container(
              child: Text("$error"),
            );
          },
        ),
      ),
    );
  }
}
