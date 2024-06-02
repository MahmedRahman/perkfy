import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perkfy/shared/component/app_button.dart';
import 'package:perkfy/shared/component/custom_text_field.dart';

import '../../../../web_serives/model/api_response_model.dart';
import '../../../../web_serives/web_services.api.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController phoneNumberController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController messageController = TextEditingController(text: '');
  ContactUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactUs'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send us a message',
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
              onChanged: (value) {},
              controller: nameController,
              borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: 'Phone Number',
              onChanged: (value) {},
              controller: phoneNumberController,
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
              controller: emailController,
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
              controller: messageController,
              onChanged: (value) {},
              borderColor: Color(0xffE6EAF0), // You can specify different colors for different fields
            ),
            Spacer(),
            SizedBox(
              width: Get.width,
              child: AppButton(
                text: "Send Message",
                onPressed: () async {
                  ResponseModel responseModel = await WebServices().contactUsMessage(
                    email: emailController.text,
                    name: nameController.text,
                    phoneNumber: phoneNumberController.text,
                    message: messageController.text,
                  );
                  Get.back();
                  Get.snackbar("succeeded", 'Message sent successfuly');
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
