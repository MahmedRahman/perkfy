import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perkfy/shared/component/rewards_card.dart';

import '../controllers/rewards_claim_controller.dart';

class RewardsClaimView extends GetView<RewardsClaimController> {
  const RewardsClaimView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Claim reward'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Container(
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              // Group: Group 163120
              Container(
                alignment: Alignment(-0.04, 0.03),
                width: 361.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Scan Qr Code With Cashier\nYou Have 17,585 Points. After Claiming This Reward, You Have 16,835 Points Remaining.',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                      height: 1.38,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  // var str =
                  //     r"WbL6CcZDK3LdkmOkst1q6rOkC4ZkRavz6YM/+z0wb5P1WquAkmjePCYVJf/TCD7Po6kMaGbteLx2KEE2TXw/lH69bDFtFZPJl/8ftLbKbbc4XVi7MQ/ZFV2pEqw3d0zOh5l+Pb458LvA8aLL6MBwfMeB/C+NdINoAOUxJJev5xfWVn5LPvxl421AdMPRX7bP+YxabtJ9N04SjN4Go0ceEt6jXtl56yE08xW5Ed7Nhn+KqSYHwusrn3LEZ7HLyF2FkSA+3DZoeJ1IkIUnJtVarRz4ceW9Y7B4acT7yQNt46E0IgWLVJ0SWMuVMKR+SeOQDPVJNPZnWWbaIdPix06ahcd4tP0SMrKMbnEnePtuxwdGqY/5dwR0EsJ1xpg7qLRf5mRUuNPQzW5URtFwKH5OQoP2NZ+A4ApMFddt7mM8JayeAAg0zLDbJkv4h53gN+x9QB9KUZS7anC/YyRA3rrVN+acQD/lkXTd/koQOKPbqNrhj1ifCpnDryHkZ+I7OF7QqdyVtD7nTmb0N9ZL5VG4+CWl/s5M92FAODIB6GJrCTmdKl12gbcCT5OTABYqhr32FYKU13zXFVW1i9qElD3AVzdszlQOYO7Wt0jA2E5NNfc=";
                  // controller.AddDycrypted(encryptedString: str);
                },
                child: Image.asset(
                  "assets/images/qr.png",
                  //colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RewardsCard(
                image: "",
                PointNumber: 100.toString(),
                collect: 200.toString(),
                title: "NAME".toString(),
                percent: .5.toString(),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
