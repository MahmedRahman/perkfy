import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:perkfy/app/routes/app_pages.dart';

AppBar customAppBar({
  required String title,
  required Function()? onPressed,
}) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
        onPressed: () {
          Get.toNamed(Routes.NOTIFACTION);
        },
        icon: SvgPicture.asset(
          "assets/images/notifaction.svg",
          colorFilter: ColorFilter.mode(
            Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),
    ],
  );
  // return PreferredSize(
  //   preferredSize: Size.fromHeight(30 + 15), // Typical AppBar height
  //   child: Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.only(
  //         bottomLeft: Radius.circular(8),
  //         bottomRight: Radius.circular(8),
  //       ),
  //       border: Border.all(
  //         color: Color(0xff707070),
  //         width: .5,
  //       ),
  //     ),
  //     child: Column(
  //       children: [
  //         SizedBox(
  //           height: 35 + 15,
  //         ),
  //         Container(
  //           child: Row(
  //             children: [
  //               SizedBox(
  //                 width: 16,
  //               ),
  //               Text(
  //                 '$title',
  //                 style: TextStyle(
  //                   fontSize: 25.0,
  //                   fontFamily: "RubikMedium",
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //               Spacer(),
  //               IconButton(
  //                 onPressed: () {
  //                   Get.toNamed(Routes.NOTIFACTION);
  //                 },
  //                 icon: SvgPicture.asset(
  //                   "assets/images/notifaction.svg",
  //                   colorFilter: ColorFilter.mode(
  //                     Colors.black,
  //                     BlendMode.srcIn,
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 16,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}
