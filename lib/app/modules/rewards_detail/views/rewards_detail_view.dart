import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/component/app_button.dart';
import 'package:perkfy/shared/service.auth.dart';

import '../controllers/rewards_detail_controller.dart';

class RewardsDetailView extends GetView<RewardsDetailController> {
  const RewardsDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot["name"]),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    snapshot["imageUrl"].toString(),
                    width: 64,
                    height: 64,
                    fit: BoxFit.fill,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Icon(Icons.error); // Displays an error icon if the image fails to load
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    snapshot["name"].toString(),
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      height: 1.18,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    snapshot["description"].toString(),
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                      height: 1.54,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'You Have ${Get.find<AuthService>().user["points"].toString()} Points.',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      height: 1.67,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/start_svg.svg"),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        snapshot["pointsCount"].toString(),
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: Get.width,
                    child: AppButton(
                      text: "Claim Reward",
                      onPressed: () {
                        Get.toNamed(Routes.REWARDS_CLAIM);
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
