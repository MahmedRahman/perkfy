import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:perkfy/app/modules/home/controllers/home_controller.dart';
import 'package:perkfy/app/modules/qr_scan/views/qr_scan_view.dart';
import 'package:perkfy/shared/component/custom_app_bar.dart';

import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  const ScanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Scan",
        onPressed: () {},
      ),
      body: controller.obx((snapshot) {
        return Container(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 91,
                ),
                SvgPicture.asset(
                  "assets/images/logo.svg",
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Scan to collect Stars',
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
                Obx(() {
                  return Text(
                    'Collect ${KgainPoints.value.toString()} stars per ${KgainMoney.value.toString()} EGP',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  );
                }),
                SizedBox(
                  height: 45,
                ),
                InkWell(
                  onTap: () async {
                    // var str =
                    //     r"WbL6CcZDK3LdkmOkst1q6rOkC4ZkRavz6YM/+z0wb5P1WquAkmjePCYVJf/TCD7Po6kMaGbteLx2KEE2TXw/lH69bDFtFZPJl/8ftLbKbbc4XVi7MQ/ZFV2pEqw3d0zOh5l+Pb458LvA8aLL6MBwfMeB/C+NdINoAOUxJJev5xfWVn5LPvxl421AdMPRX7bP+YxabtJ9N04SjN4Go0ceEt6jXtl56yE08xW5Ed7Nhn+KqSYHwusrn3LEZ7HLyF2FkSA+3DZoeJ1IkIUnJtVarRz4ceW9Y7B4acT7yQNt46E0IgWLVJ0SWMuVMKR+SeOQDPVJNPZnWWbaIdPix06ahcd4tP0SMrKMbnEnePtuxwdGqY/5dwR0EsJ1xpg7qLRf5mRUuNPQzW5URtFwKH5OQoP2NZ+A4ApMFddt7mM8JayeAAg0zLDbJkv4h53gN+x9QB9KUZS7anC/YyRA3rrVN+acQD/lkXTd/koQOKPbqNrhj1ifCpnDryHkZ+I7OF7QqdyVtD7nTmb0N9ZL5VG4+CWl/s5M92FAODIB6GJrCTmdKl12gbcCT5OTABYqhr32FYKU13zXFVW1i9qElD3AVzdszlQOYO7Wt0jA2E5NNfc=";
                    // controller.AddDycrypted(encryptedString: str);

                    var result = await Get.to(() => QRScannerScreen());
                    if (result != null) {
                      print(result);

                      controller.AddDycrypted(encryptedString: result);
                    } else {
                      Get.snackbar(
                        "Error in scanning",
                        "Kindly scan again",
                      );
                    }
                  },
                  child: Image.asset(
                    "assets/images/qr.png",
                    //colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
