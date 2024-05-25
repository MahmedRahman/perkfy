import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/component/rewards_card.dart';
import 'package:perkfy/shared/service.auth.dart';

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
                SizedBox(
                  height: 19,
                ),
                Text(
                  'Rewards Stars',
                  style: TextStyle(fontSize: 14.0, color: Color(0xffCDA259)),
                ),
                Row(
                  children: [
                    Text(
                      '0',
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
                    SizedBox(
                      width: 10,
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
                // color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      rewards_available(),
                      SizedBox(
                        height: 17,
                      ),
                      RewardsCard(
                        image: "",
                        PointNumber: 200.toString(),
                        collect: 500.toString(),
                        title: "sss",
                        percent: .2.toString(),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'If you Collect 250 stars more you will get',
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RewardsCard(
                        image: "",
                        PointNumber: 200.toString(),
                        collect: 500.toString(),
                        title: "sss",
                        percent: .2.toString(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      quote(),
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
          Image.asset("assets/images/user_avater.png"),
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

  Row rewards_available() {
    return Row(
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
        Text(
          'View All',
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Column hotdrink() {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/images/mug_1.svg"),
            SvgPicture.asset("assets/images/mug_2.svg"),
            SvgPicture.asset("assets/images/mug_1.svg"),
            SvgPicture.asset("assets/images/mug_1.svg"),
          ],
        ),
      ],
    );
  }

  Column quote() {
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
                      "Good morning \nThis Day is Beautiful \nAnd so are You.",
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
  }
}
