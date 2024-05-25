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
      body: controller.obx((snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(Title: "New \nPassword"),
              SizedBox(height: 40),
              CustomTextField(
                label: 'New Password',
                onChanged: (value) => controller.newPasswordController.text = value,
                borderColor: Color(0xffE6EAF0),
                isPassword: true,
                controller: controller.newPasswordController,
              ),
              CustomTextField(
                label: 'Confirm New Password',
                onChanged: (value) => controller.confirmNewPasswordController.text = value,
                borderColor: Color(0xffE6EAF0),
                isPassword: true,
                controller: controller.confirmNewPasswordController,
              ),
              Spacer(),
              SizedBox(
                width: Get.width,
                child: AppButton(
                  text: "Save",
                  onPressed: () {
                    if (controller.newPasswordController.text.isEmpty ||
                        !controller.isPasswordStrong(controller.newPasswordController.text)) {
                      Get.snackbar("Error", "Please enter a valid password.");
                    } else if (controller.newPasswordController.text != controller.confirmNewPasswordController.text) {
                      Get.snackbar("Error", "Passwords do not match");
                    } else {
                      controller.forgetPasswordConfirmation(
                        newPassword: controller.newPasswordController.text,
                      ); // Navigate if all conditions are met
                    }

                    // if (controller.newPasswordController.text == controller.confirmNewPasswordController.text) {
                    //   controller.forgetPasswordConfirmation(
                    //     newPassword: controller.newPasswordController.text,
                    //   );
                    //   //Get.toNamed(Routes.HOME); // Navigate if passwords match
                    // } else {
                    //   Get.snackbar("Error", "Passwords do not match"); // Show error if they don't
                    // }
                  },
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        );
      }),
    );
  }
}
