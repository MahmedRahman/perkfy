import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/shared/component/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: controller.obx(
        (snapshot) {
          return Padding(
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
                Expanded(
                  child: ListView(
                    children: List.generate(
                      snapshot.length,
                      (index) {
                        return LocationInfo(
                          addresss: snapshot[index]["addresss"].toString(),
                          name: snapshot[index]["name"].toString(),
                          latitude: snapshot[index]["latitude"].toString(),
                          longitude: snapshot[index]["longitude"].toString(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  String addresss;
  String name;
  String latitude;
  String longitude;
  LocationInfo({
    required this.addresss,
    required this.name,
    required this.latitude,
    required this.longitude,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () async {
          Uri googleUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
          if (await canLaunchUrl(googleUrl)) {
            await launchUrl(googleUrl);
          } else {
            throw 'Could not open the map.';
          }
        }, // Example latitude and longitude
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$name',
              style: TextStyle(
                fontSize: 14.0,
                height: 1.38,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '$addresss',
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
                fontSize: 14.0,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Divider(),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
