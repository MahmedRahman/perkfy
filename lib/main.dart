import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:perkfy/app/modules/home/controllers/home_controller.dart';
import 'package:perkfy/app/modules/home/views/home_view.dart';
import 'package:perkfy/app/modules/notifaction/controllers/notifaction_controller.dart';
import 'package:perkfy/app/modules/scan/controllers/scan_controller.dart';
import 'package:perkfy/app/modules/stores/controllers/stores_controller.dart';
import 'package:perkfy/auth_storage.dart';
import 'package:perkfy/shared/service.auth.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Get.lazyPut(() => AuthStorage());
  Get.lazyPut(() => AuthService());

  Get.lazyPut(() => HomeController());

  
  Get.lazyPut(() => ScanController());
  Get.lazyPut(() => RewardsBoxController());
  Get.lazyPut(() => StoresController());

  Get.lazyPut(() => NotifactionController());
  Get.lazyPut(() => QuoteController());
  Get.lazyPut(() => RewardsBoxController());
  Get.lazyPut(() => CupsBoxController());

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
