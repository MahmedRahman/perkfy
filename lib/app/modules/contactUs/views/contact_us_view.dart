import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/shared/component/app_button.dart';
import 'package:perkfy/shared/component/custom_text_field.dart';

import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactUsView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Us a message',
              style: TextStyle(
                fontSize: 17.0,
                color: const Color(0xFF221D1D),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              label: 'Name',
              onChanged: (value) {
                // Handle text change
                print("First Name: $value");
              },
              borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: 'Phone Number',
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
              label: 'Message',
              onChanged: (value) {
                // Handle text change
                print("First Name: $value");
              },
              borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
            ),
            Spacer(),
            SizedBox(
              width: Get.width,
              child: AppButton(
                text: "Send Message",
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
