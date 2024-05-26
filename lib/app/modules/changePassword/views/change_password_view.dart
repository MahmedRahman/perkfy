import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perkfy/shared/component/app_button.dart';
import 'package:perkfy/shared/component/custom_text_field.dart';
import 'package:perkfy/shared/service.auth.dart';

import '../../../../web_serives/model/api_response_model.dart';
import '../../../../web_serives/web_services.api.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  final TextEditingController currentPasswordController =
      TextEditingController(text: '');
  final TextEditingController newPasswordController =
      TextEditingController(text: '');
  final TextEditingController confirmPasswordController =
      TextEditingController(text: '');
  ChangePasswordView({Key? key}) : super(key: key);
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
              controller: currentPasswordController,
              borderColor: Color(0xffE6EAF0),
              isPassword: true, // Set this to true for password fields
            ),
            CustomTextField(
              label: 'New Password',
              onChanged: (value) {},
              controller: newPasswordController,
              borderColor: Color(0xffE6EAF0),
              isPassword: true, // Set this to true for password fields
            ),
            CustomTextField(
              label: 'Confirm New Password',
              controller: confirmPasswordController,
              onChanged: (value) {},
              borderColor: Color(0xffE6EAF0),
              isPassword: true, // Set this to true for password fields
            ),
            Spacer(),
            SizedBox(
              width: Get.width,
              child: AppButton(
                text: "Save Changes",
                onPressed: () async {
                  ResponseModel responseModel = await WebServices()
                      .changePassword(
                          userId: Get.find<AuthService>().user["id"],
                          newPassword: newPasswordController.text,
                          oldPassword: currentPasswordController.text);
                  Get.back();
                  Get.snackbar("succeeded", 'Password updated successfuly');
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
