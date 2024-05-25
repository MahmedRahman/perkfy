import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/shared/component/custom_app_bar.dart';

import '../controllers/stores_controller.dart';

class StoresView extends GetView<StoresController> {
  const StoresView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Stores",
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Image.asset(
              "assets/images/1_qYUvh-EtES8dtgKiBRiLsA (1).png",
              width: Get.width,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 8,
            ),
            LocationInfo(),
            Divider(),
            LocationInfo(),
            Divider(),
            LocationInfo(),
          ],
        ),
      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  const LocationInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Al-Rehab City, Cairo',
            style: TextStyle(
              fontSize: 14.0,
              height: 1.38,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Rehab Mall 2 Branch\nShop No. 4 - Ground Floor - Mall 2 - Rehab City ,Rehab Mall 2',
            style: TextStyle(
              fontSize: 14.0,
              color: const Color(0xFF626262),
              fontWeight: FontWeight.w300,
              height: 1.17,
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            'Get Directions',
            style: TextStyle(
              fontSize: 12.0,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
