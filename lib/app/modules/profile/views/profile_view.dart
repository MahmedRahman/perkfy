import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/app/modules/deleteAccount/controllers/delete_account_controller.dart';
import 'package:perkfy/app/routes/app_pages.dart';
import 'package:perkfy/shared/component/custom_list_Item.dart';
import 'package:perkfy/shared/service.auth.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text("${Get.find<AuthService>().user["fullName"].toString()}'"),
                subtitle: Text("${Get.find<AuthService>().user["email"].toString()}'"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${Get.find<AuthService>().user["imageUrl"].toString()}'"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomListItem(
              title: "History",
              onTap: () {
                Get.toNamed(Routes.HISTORY);
                // Implement your navigation or functionality here
              },
            ),
            Divider(),
            CustomListItem(
                title: "Personal Info",
                onTap: () {
                  Get.toNamed(Routes.PERSONAL_INFO);
                  print("History tapped");
                  // Implement your navigation or functionality here
                }),
            Divider(),
            CustomListItem(
                title: "Change Password",
                onTap: () {
                  Get.toNamed(Routes.CHANGE_PASSWORD);
                  print("History tapped");
                  // Implement your navigation or functionality here
                }),
            Divider(),
            CustomListItem(
                title: "Contact Us",
                onTap: () {
                  Get.toNamed(Routes.CONTACT_US);
                  print("History tapped");
                  // Implement your navigation or functionality here
                }),
            Divider(),
            CustomListItem(
                title: "Terms of use",
                onTap: () {
                  Get.toNamed(Routes.TERMS_OF_USE);

                  print("History tapped");
                  // Implement your navigation or functionality here
                }),
            Divider(),
            CustomListItem(
                title: "Privacy Statement",
                onTap: () {
                  Get.toNamed(Routes.PRIVACY_STATEMENT);

                  print("History tapped");
                  // Implement your navigation or functionality here
                }),
            Divider(),
            CustomListItem(
                title: "Delete Account",
                onTap: () {
                  // Get.toNamed(Routes.DELETE_ACCOUNT);
                  final DeleteAccountController deletController = Get.put(DeleteAccountController());
                  deletController.showDeleteDialog();
                  // Implement your navigation or functionality here
                }),
          ],
        ),
      ),
    );
  }
}
