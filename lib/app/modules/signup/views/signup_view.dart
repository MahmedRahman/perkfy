import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/component/app_button.dart';
import 'package:perkfy/shared/component/custom_checkbox.dart';
import 'package:perkfy/shared/component/custom_date_picker.dart';
import 'package:perkfy/shared/component/custom_text_field.dart';
import 'package:perkfy/shared/component/custom_title.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 22,
                  ),
                  CustomTitle(
                    Title: "Create a new\naccount",
                  ),
                  CustomTextField(
                    label: 'First Name',
                    controller: firstNameController,
                    onChanged: (value) {},
                    borderColor: Color(0xffE6EAF0),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: 'Phone number',
                    onChanged: (value) {},
                    borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value != null && value.length != 10) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: 'Email address',
                    onChanged: (value) {},
                    borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value != null && !value.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: 'Password',
                    onChanged: (value) {},
                    borderColor: Color(0xffE6EAF0),
                    isPassword: true, // Set this to true for password fields
                  ),
                  SizedBox(height: 20),
                  CustomDatePicker(
                    label: 'Birthday (Optional)',
                    hint: 'Select your birthday',
                    onDateSelected: (DateTime? date) {
                      print('Selected Date: $date');
                    },
                  ),
                  SizedBox(height: 20),
                  CustomCheckbox(
                    title:
                        'I want to hear about exclusive offers, announcements and the newest products from social speciality coffee.',
                    onChanged: (bool? value) {
                      // Handle checkbox change
                      print("Checkbox is now: $value");
                    },
                  ),
                  CustomCheckbox(
                    title: 'I have read and agreed on the terms and conditions of the app',
                    onChanged: (bool? value) {
                      // Handle checkbox change
                      print("Checkbox is now: $value");
                    },
                  ),
                  Spacer(),
                  SizedBox(
                    width: Get.width,
                    child: AppButton(
                      text: "Join Rewards",
                      onPressed: () {
                        // Get.toNamed(Routes.SIGNUP);
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SIGNIN);
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
                              text: 'Already have account ? ',
                            ),
                            TextSpan(
                              text: 'Login',
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
          ),
        ),
      ),
    );
  }
}
