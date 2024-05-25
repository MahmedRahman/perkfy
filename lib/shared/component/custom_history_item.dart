import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHistoryItem extends StatelessWidget {
  final String title;
  final String gainedStars;
  final String usedPoints;
  final String expiringPoints;
  final String expiryDate;
  final String timestamp;

  const CustomHistoryItem({
    Key? key,
    required this.title,
    required this.gainedStars,
    required this.usedPoints,
    required this.expiringPoints,
    required this.expiryDate,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    (title == "Redeem Stars") ? Color(0xffF0F0F0).withOpacity(.1) : Color(0xff048919).withOpacity(.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/images/doller.svg",
                  colorFilter: ColorFilter.mode(
                    Color(0xff048919),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            // Customize as needed
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color:
                    (title == "Redeem Stars") ? Color(0xffF0F0F0).withOpacity(.1) : Color(0xff048919).withOpacity(.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("$gainedStars Star"),
              ),
            ),
            Spacer(),
            Text(
              '${timestamp.toString()}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          '+${gainedStars} Stars',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Text('280 points used, 350 expire 4 months from now', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 15),
      ],
    );
  }
}
