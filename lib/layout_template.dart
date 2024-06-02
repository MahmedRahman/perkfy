import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';

LayoutTemplate({
  required child,
  required currentIndex,
}) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: child,
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) {
          Get.toNamed(Routes.HOME);
        }
        if (index == 1) {
          Get.toNamed(Routes.SCAN);
        }
        if (index == 2) {
          Get.toNamed(Routes.REWARDS);
          //Get.find<FavoritesController>().loadFavoriteDates();
        }
        if (index == 3) {
          Get.toNamed(Routes.STORES);
          // Ge
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 14,
      ),
      items: [
        BottomNavigationBarItem(
          icon: currentIndex == 0
              ? SvgPicture.asset(
                  "assets/images/home_select.svg",
                )
              : SvgPicture.asset(
                  "assets/images/home.svg",
                ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 1
              ? SvgPicture.asset(
                  "assets/images/scan.svg",
                )
              : SvgPicture.asset("assets/images/scan_select.svg"),
          label: "Scan",
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 2
              ? SvgPicture.asset(
                  "assets/images/reward_select.svg",
                )
              : SvgPicture.asset("assets/images/rewords.svg"),
          label: "Rewards",
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 3
              ? SvgPicture.asset(
                  "assets/images/store_select.svg",
                )
              : SvgPicture.asset("assets/images/stores.svg"),
          label: "Stores",
        ),
      ],
    ),
  );
}
