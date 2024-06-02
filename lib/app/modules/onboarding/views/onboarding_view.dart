import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/component/custom_list_tile.dart';
import 'package:perkfy/shared/component/app_button.dart';
import 'package:perkfy/shared/styles.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),

                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    width: 40,
                    alignment: Alignment.centerLeft, // <---- The magic
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      height: 40.0,
                    ),
                  ),
                ), // Replace with your logo asset
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),

                        Text(
                          'Sip your way to more Rewards',
                          style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        CustomListTile(
                          title: "Collect stars When Placing your order".capitalizeFirst.toString(),
                          subtitle: "Collect 4 stars Per 100 EGP when grabbing your Dark Solution coffee favorites"
                              .capitalizeFirst
                              .toString(),
                          icon: "assets/images/image1.svg",
                        ),

                        CustomListTile(
                          title: "Redeem Stars for free drink".capitalizeFirst.toString(),
                          subtitle:
                              "Every 250 Stars gets you a free Drink. Any drink. Any size!".capitalizeFirst.toString(),
                          icon: "assets/images/image2.svg",
                        ),

                        CustomListTile(
                          title: "Get to Gold".capitalizeFirst.toString(),
                          subtitle:
                              "750 Stars gets you to gold level. Enjoy a free drink on your birthday exclusive offers and other exciting benefits."
                                  .capitalizeFirst
                                  .toString(),
                          icon: "assets/images/image3.svg",
                        ),
                        // Add more text widgets as needed
                        Spacer(),

                        Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: const Color(0xFF4A4A4A),
                              height: 1.23,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          width: Get.width,
                          child: AppButton(
                            text: "Register Now",
                            onPressed: () {
                              Get.toNamed(Routes.SIGNUP);
                            },
                          ),
                        ),
                        SizedBox(height: 12),
                        Center(
                          child: Text(
                            'Already a member ?',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: const Color(0xFF4A4A4A),
                              height: 1.23,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          width: Get.width,
                          child: AppButton(
                            text: "Sign in",
                            onPressed: () {
                              Get.toNamed(Routes.SIGNIN);
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
