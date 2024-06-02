import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/component/app_button.dart';
import 'package:perkfy/shared/component/custom_text_field.dart';
import 'package:perkfy/shared/component/custom_title.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneController =
      TextEditingController(text: kDebugMode ? "01223560607" : ""); // Add this line
  final TextEditingController passwordController =
      TextEditingController(text: kDebugMode ? "P@ssw0rd" : ""); // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: controller.obx((snapshot) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTitle(Title: "Welcome\nback!"),
                SizedBox(height: 20),
                CustomTextField(
                  label: 'Mobile number',

                  controller: phoneController,
                  onChanged: (value) {},
                  // Add your onChanged logic or leave empty if not needed
                  borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    } else if (!RegExp(r'^\+?0[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: 'Password',

                  controller: passwordController,
                  onChanged: (value) {}, // Add your onChanged logic or leave empty if not needed
                  borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.FORGETPASSWORD);
                      // Add action for forgot password
                      print("Forgot password tapped");
                    },
                    child: Text("Forget password?",
                        style: TextStyle(color: Colors.black, decoration: TextDecoration.underline)),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: Get.width,
                  child: AppButton(
                    text: "Sign in",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        controller.loginWithPhone(phone: phoneController.text, password: passwordController.text);
                      }
                    },
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.SIGNUP);
                      print('Don’t have account ? create account');
                    },
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: const Color(0xFF4A4A4A),
                          height: 1.23,
                        ),
                        children: [
                          TextSpan(
                            text: 'Don’t have account ? ',
                          ),
                          TextSpan(
                            text: 'Create account',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        );
      }),
    );
  }
}
