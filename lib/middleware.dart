import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perkfy/app/modules/home/views/home_view.dart';
import 'package:perkfy/app/modules/rewards/views/rewards_view.dart';
import 'package:perkfy/app/modules/scan/views/scan_view.dart';
import 'package:perkfy/app/modules/stores/views/stores_view.dart';
import 'package:perkfy/layout_template.dart';

int currentIndex = 0;

class GlobalMiddleware extends GetMiddleware {
  @override
  // TODO: implement priority
  int? get priority => 1;

  @override
  Widget onPageBuilt(Widget page) {
    List<Widget> screenList = [HomeView(), ScanView(), RewardsView(), StoresView()];

    if (page is HomeView || page is ScanView || page is RewardsView || page is StoresView) {
      if (page is HomeView) currentIndex = 0;
      if (page is ScanView) currentIndex = 1;
      if (page is RewardsView) currentIndex = 2;
      if (page is StoresView) currentIndex = 3;

      return LayoutTemplate(
        child: page,
        currentIndex: currentIndex,
      );
    }

    return page;
  }
}
