import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/auth_storage.dart';
import 'package:perkfy/shared/component/count_down_timer.dart';
import 'package:perkfy/shared/component/custom_title.dart';
import 'package:perkfy/shared/service.auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/otpcode_controller.dart';

class OtpcodeView extends GetView<OtpcodeController> {
  OtpcodeView({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController(text: Get.arguments[0]);

  @override
  Widget build(BuildContext context) {
    // Start your navigation after some delay
    Future.delayed(Duration(seconds: 2), () {
      if (Get.previousRoute.toString() == "/signup") {
        Get.find<AuthStorage>().saveTokenAndUserId(
          Get.find<AuthService>().token,
          Get.find<AuthService>().user["id"],
        );

        Get.offAllNamed(Routes.HOME);
        return;
      }

      Get.toNamed(Routes.NEWPASSWORD, arguments: Get.arguments);
      // Navigate to home after the splash
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 22,
            ),
            CustomTitle(
              Title: "Verification\ncode",
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'Type the verification code we sent to you in sms',
              style: TextStyle(
                fontSize: 16.0,
                color: const Color(0xFF2B3238),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
                selectedColor: Colors.blue,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              controller: textEditingController,
              onCompleted: (v) {
                print("Completed");
                Get.toNamed(Routes.HOME);
              },
              onChanged: (value) {
                print(value);
              },
              beforeTextPaste: (text) {
                return true;
              },
            ),
            SizedBox(
              height: 40,
            ),
            CountdownTimer(),
          ],
        ),
      ),
    );
  }
}
