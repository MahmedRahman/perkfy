import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/component/app_button.dart';
import 'package:perkfy/shared/component/custom_text_field.dart';
import 'package:perkfy/shared/component/custom_title.dart';

import '../controllers/newpassword_controller.dart';

class NewpasswordView extends GetView<NewpasswordController> {
  const NewpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(Title: "New \nPassword"),
            SizedBox(
              height: 40,
            ),
            CustomTextField(
              label: 'New Password',
              onChanged: (value) {}, // Add your onChanged logic or leave empty if not needed
              borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
              isPassword: true,
              // controller: _passwordController,
            ),
            CustomTextField(
              label: 'Confirm New Password',
              onChanged: (value) {}, // Add your onChanged logic or leave empty if not needed
              borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
              isPassword: true,
              // controller: _passwordController,
            ),
            Spacer(),
            SizedBox(
              width: Get.width,
              child: AppButton(
                text: "Save",
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
