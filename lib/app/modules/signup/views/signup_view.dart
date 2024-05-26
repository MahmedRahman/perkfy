import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      body: controller.obx((snapshot) {
        return Container(
          // height: Get.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: 8),
                  CustomTextField(
                    label: 'Phone number',
                    controller: phoneNumberController,
                    onChanged: (value) {},
                    borderColor: Color(
                        0xffE6EAF0), // You can specify different colors for different fields
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      print(value!.length.toString());
                      if (value.length != 11) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    label: 'Email address',
                    controller: emailController,
                    onChanged: (value) {},
                    borderColor: Color(
                        0xffE6EAF0), // You can specify different colors for different fields
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value != null && !value.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    label: 'Password',
                    controller: passwordController,
                    onChanged: (value) {},
                    borderColor: Color(0xffE6EAF0),
                    isPassword: true, // Set this to true for password fields
                  ),
                  SizedBox(height: 20),
                  CustomDatePicker(
                    label: 'Birthday (Optional)',
                    hint: 'Select your birthday',
                    onDateSelected: (DateTime? date) {
                      controller.selectDate =
                          DateFormat('yyyy-MM-dd').format(date!);
                      print('Selected Date: ${controller.selectDate}');
                    },
                  ),
                  SizedBox(height: 8),
                  CustomCheckbox(
                    title:
                        'I want to hear about exclusive offers, announcements and the newest products from social speciality coffee.',
                    onChanged: (bool? value) {
                      controller.sendEmail = value!;
                    },
                    initialValue: controller.sendEmail,
                  ),
                  CustomCheckbox(
                    title:
                        'I have read and agreed on the terms and conditions of the app',
                    initialValue: controller.terms,
                    onChanged: (bool? value) {
                      controller.terms = value!;
                    },
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: Get.width,
                    child: AppButton(
                      text: "Join Rewards",
                      onPressed: () {
                        if (controller.terms == false) {
                          Get.snackbar("Read aregment",
                              " read and agreed on the terms and conditions",
                              backgroundColor: Colors.red.shade400);
                          return;
                        }
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          controller.signUp(
                            name: firstNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            birthday: controller.selectDate,
                            phoneNumber: phoneNumberController.text,
                            sendEmail: controller.sendEmail.toString(),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 8),
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
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
