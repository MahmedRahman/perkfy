import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perkfy/app/modules/notifaction/controllers/notifaction_controller.dart';
import 'package:perkfy/shared/service.auth.dart';
import 'app/routes/app_pages.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Get.lazyPut(() => AuthService());
  Get.lazyPut(() => NotifactionController());

  runApp(
    GetMaterialApp(
      title: "perkfy",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      transitionDuration: Duration.zero,
      theme: ThemeData(
        fontFamily: "MetropolisMedium",
      ),
    ),
  );
}
