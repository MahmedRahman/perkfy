import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/component/custom_app_bar.dart';
import 'package:perkfy/shared/component/rewards_card.dart';
import 'package:perkfy/shared/service.auth.dart';

import '../controllers/rewards_controller.dart';

class RewardsView extends GetView<RewardsController> {
  const RewardsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Rewards",
        onPressed: () {},
      ),
      body: controller.obx(
        (snapshot) {
          return ListView(
            padding: EdgeInsets.all(16),
            children: List.generate(
              snapshot.length,
              (index) {
                return RewardsCard(
                  image: snapshot[index]["imageUrl"].toString(),
                  PointNumber: snapshot[index]["pointsCount"].toString(),
                  collect: snapshot[index]["nearestPoints"].toString(),
                  title: snapshot[index]["name"].toString(),
                  percent: snapshot[index]["percentage"].toString(),
                  onTap: () {
                    Get.toNamed(
                      Routes.REWARDS_DETAIL,
                      arguments: snapshot[index],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
