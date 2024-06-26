import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/component/app_button.dart';
import 'package:perkfy/shared/component/custom_text_field.dart';
import 'package:perkfy/shared/component/custom_title.dart';

import '../controllers/forgetpassword_controller.dart';

class ForgetpasswordView extends GetView<ForgetpasswordController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: controller.obx((snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(Title: "Forget Password"),
                Text(
                  'Please enter you phone number ',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: const Color(0xFF2B3238),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  label: 'Phone number',
                  onChanged: (value) {},
                  borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
                  keyboardType: TextInputType.phone,
                  controller: phone,
                  validator: (value) {
                    if (value != null && value.length != 11) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                ),
                Spacer(),
                SizedBox(
                  width: Get.width,
                  child: AppButton(
                    text: "Submit",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.forgetPassword(
                          phoneNumber: phone.text.toString(),
                        );
                      }
                    },
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
