import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Start your navigation after some delay
    Future.delayed(Duration(seconds: 3), () {
 Get.offAllNamed(Routes.ONBOARDING);  // Navigate to home after the splash
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            SvgPicture.asset('assets/images/logo.svg', width: 260), // Replace with your logo asset
            SizedBox(height: 20),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Powered by',
                  style: TextStyle(
                    fontSize: 11.0,
                    color: Colors.white,
                    height: 0.09,
                  ),
                ),
                SizedBox(width: 5,),
                Image.asset(
                  'assets/images/logo_2.png',
                  width: 38,
                ),
              ],
            ), // Replace with your logo asset
SizedBox(height: 16,),
            // Text('Dark Solution', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold,),),
            // Text('Creativity With Identity', style: TextStyle(color: Colors.white, fontSize: 18,),),
          ],
        ),
      ),
    );
  }
}
