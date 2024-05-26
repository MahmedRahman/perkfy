import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/component/app_button.dart';
import '../../../../shared/component/custom_text_field.dart';
import '../../../../shared/service.auth.dart';
import '../../../../web_serives/model/api_response_model.dart';
import '../../../../web_serives/web_services.api.dart';
import '../controllers/personal_info_controller.dart';

class PersonalInfoView extends GetView<PersonalInfoController> {
  final TextEditingController firstNameController =
      TextEditingController(text: '');
  final TextEditingController lastNameController =
      TextEditingController(text: '');
  final TextEditingController phoneNumberController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController birthdayController =
      TextEditingController(text: '');
  final TextEditingController genderController =
      TextEditingController(text: '');

  PersonalInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    firstNameController.text =
        "${Get.find<AuthService>().user["firstName"].toString()}";
    lastNameController.text =
        "${Get.find<AuthService>().user["lastName"].toString()}";
    emailController.text =
        "${Get.find<AuthService>().user["email"].toString()}";
    phoneNumberController.text =
        "${Get.find<AuthService>().user["phoneNumber"].toString()}";
    birthdayController.text =
        "${Get.find<AuthService>().user["birthday"].toString()}";
    genderController.text =
        "${Get.find<AuthService>().user["gender"].toString()}" == '0'
            ? "Male"
            : "Female";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Info'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/user_avater.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      PositionedDirectional(
                        bottom: 5,
                        end: 5,
                        child: Image.asset(
                          'assets/images/camera_icon.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    label: 'First Name',
                    onChanged: (value) {},
                    controller: firstNameController,
                    borderColor: Color(0xffE6EAF0),
                    isPassword: false, // Set this to true for password fields
                  ),
                  CustomTextField(
                    label: 'Last Name',
                    controller: lastNameController,
                    onChanged: (value) {},
                    borderColor: Color(0xffE6EAF0),
                    isPassword: false, // Set this to true for password fields
                  ),
                  CustomTextField(
                    label: 'Email Address',
                    controller: emailController,
                    onChanged: (value) {},
                    borderColor: Color(0xffE6EAF0),
                    isPassword: false, // Set this to true for password fields
                  ),
                  CustomTextField(
                    label: 'Phone Number',
                    controller: phoneNumberController,
                    onChanged: (value) {},
                    borderColor: Color(0xffE6EAF0),
                    isPassword: false, // Set this to true for password fields
                  ),
                  CustomTextField(
                    label: 'Birthday (Optional)',
                    controller: birthdayController,
                    onChanged: (value) {},
                    borderColor: Color(0xffE6EAF0),
                    isPassword: false, // Set this to true for password fields
                  ),
                  CustomTextField(
                    label: 'Gender',
                    controller: genderController,
                    onChanged: (value) {},
                    borderColor: Color(0xffE6EAF0),
                    isPassword: false, // Set this to true for password fields
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                text: "Save Changes",
                onPressed: () async {
                  ResponseModel responseModel = await WebServices()
                      .updateProfile(
                          email: emailController.text,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          phoneNumber: phoneNumberController.text,
                          gender: genderController.text == "Male" ? 0 : 1,
                          birthday: birthdayController.text,
                          image: "");
                  Get.back();
                  Get.snackbar("succeeded", 'Profile updated successfuly');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
