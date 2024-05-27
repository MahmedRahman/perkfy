import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/component/rewards_card.dart';
import 'package:perkfy/shared/service.auth.dart';
import 'package:perkfy/web_serives/exception.dart';
import 'package:perkfy/web_serives/model/api_response_model.dart';
import 'package:perkfy/web_serives/web_services.api.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 55,
                ),
                userBox(),
                SizedBox(
                  height: 19,
                ),
                SvgPicture.asset(
                  "assets/images/logo.svg",
                  width: 80,
                ),

                Row(
                  children: [
                    Text(
                      'Rewards Stars',
                      style: TextStyle(fontSize: 14.0, color: Color(0xffCDA259)),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Stack(
                        children: [
                          CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 4.0,
                            percent: (() {
                              double value = Get.find<AuthService>().user["nearestRewordProgress"]?.toDouble() ?? 0.0;
                              return value.clamp(0.0, 1.0); // Ensuring the value is between 0.0 and 1.0
                            })(),
                            arcType: ArcType.FULL,
                            center: Image.asset(
                              'assets/images/cup_home_progress.png',
                              width: 40,
                              height: 45,
                            ),
                            progressColor: Color(0xffCDA259),
                            arcBackgroundColor: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${Get.find<AuthService>().user["points"].toString()}',
                              style: TextStyle(
                                fontFamily: 'Metropolis',
                                fontSize: 38.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              "assets/images/start.svg",
                            ),
                          ],
                        ),
                        Text(
                          'Collect 4 Stars for every 100EGP Spent',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: const Color(0xFFEFEFEF),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${Get.find<AuthService>().user["nearestPoints"].toString()}',
                              style: TextStyle(
                                fontFamily: 'Metropolis',
                                fontSize: 38.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              "assets/images/start.svg",
                            ),
                          ],
                        ),
                        Text(
                          'Until next reward',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: const Color(0xFFEFEFEF),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),

                // Row(
                //   children: [

                //     Spacer(),
                //     Text(
                //       "Until next reward",
                //       style: TextStyle(
                //         fontSize: 11.0,
                //         color: const Color(0xFFEFEFEF),
                //       ),
                //     )
                //   ],
                // ),

//  Spacer(),
//                     Text(
//                       '${Get.find<AuthService>().user["nearestPoints"].toString()}',
//                       style: TextStyle(
//                         fontSize: 38.0,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),

                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      RewardsBoxView(),
                      SizedBox(
                        height: 25,
                      ),
                      CupsBoxView(),
                      SizedBox(
                        height: 30,
                      ),
                      QuoteView(),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userBox() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PROFILE);
      },
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Image.asset(
            "assets/images/user_avater.png",
            width: 35,
            height: 35,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Good ${Get.find<AuthService>().user["fullName"].toString()}',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.NOTIFACTION);
            },
            child: SvgPicture.asset(
              "assets/images/notifaction.svg",
            ),
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
    );
  }
}

class CupsBoxController extends GetxController with StateMixin {
  @override
  void onInit() {
    getCups();
    super.onInit();
  }

  void getCups() async {
    try {
      ResponseModel responseModel = await WebServices().getCups(
        userId: Get.find<AuthService>().user["id"].toString(),
      );

      change(responseModel.data["data"], status: RxStatus.success());
    } on EmptyDataException {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(e.toString(), status: RxStatus.error());
    }
  }
}

class CupsBoxView extends GetView<CupsBoxController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((snapshot) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Collect To get free hot drink',
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                snapshot.length, // Assuming 'snapshot.length' is the number of images
                (index) {
                  return InkWell(
                    onTap: () {
                      if (snapshot[index]["status"].toString().toLowerCase() == "Reward".toLowerCase()) {
                        Get.toNamed(Routes.SCAN);
                      } else {
                        Get.snackbar("Done", snapshot[index]["status"].toString(), backgroundColor: Colors.amber);
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            snapshot[index]["imageURL"].toString(),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Icon(Icons.error); // Displays an error icon if the image fails to load
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      );
    });
  }
}

class RewardsBoxController extends GetxController with StateMixin {
  @override
  void onInit() {
    getRewards();
    super.onInit();
  }

  void getRewards() async {
    try {
      ResponseModel responseModel = await WebServices().getRewards();
      var firstThreeItems = responseModel.data["data"].take(2).toList();

      change(firstThreeItems, status: RxStatus.success());
    } on EmptyDataException {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(e.toString(), status: RxStatus.error());
    }
  }
}

class RewardsBoxView extends GetView<RewardsBoxController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((snapshot) {
      return Column(
        children: [
          Row(
            children: [
              Text(
                'Your Available Rewards',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.REWARDS);
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Column(
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
          ),
        ],
      );
    });
  }
}

//Rewards

class QuoteController extends GetxController with StateMixin {
  @override
  void onInit() {
    getQoute();
    super.onInit();
  }

  void getQoute() async {
    try {
      ResponseModel responseModel = await WebServices().getQoute();
      change(responseModel.data["data"], status: RxStatus.success());
    } on EmptyDataException {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(e.toString(), status: RxStatus.error());
    }
  }
}

class QuoteView extends GetView<QuoteController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((snapshot) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quote of the Day',
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 15.0,
              //color: AppColors.color1,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset("assets/images/quite2.png"),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        snapshot["content"].toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
