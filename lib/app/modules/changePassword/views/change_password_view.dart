import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/shared/component/app_button.dart';
import 'package:perkfy/shared/component/custom_text_field.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomTextField(
              label: 'Current Password',
              onChanged: (value) {},
              borderColor: Color(0xffE6EAF0),
              isPassword: true, // Set this to true for password fields
            ),
            CustomTextField(
              label: 'New Password',
              onChanged: (value) {},
              borderColor: Color(0xffE6EAF0),
              isPassword: true, // Set this to true for password fields
            ),
            CustomTextField(
              label: 'Confirm New Password',
              onChanged: (value) {},
              borderColor: Color(0xffE6EAF0),
              isPassword: true, // Set this to true for password fields
            ),
            Spacer(),
            SizedBox(
              width: Get.width,
              child: AppButton(
                text: "Save Changes",
                onPressed: () {
                  // Get.toNamed(Routes.SIGNUP);
                },
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
