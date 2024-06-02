import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget RewardsCard({
  required String image,
  required String title,
  required String collect,
  required String PointNumber,
  required String percent,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Color(0xffE4EBF4),
            )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              (image == "")
                  ? Image.asset(
                      "assets/images/image.png",
                      width: 64,
                      height: 64,
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      image,
                      width: 64,
                      height: 64,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Icon(Icons.error); // Displays an error icon if the image fails to load
                      },
                    ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '$title',
                          style: TextStyle(
                            fontSize: 18.0,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '$PointNumber',
                          style: TextStyle(
                            fontSize: 18.0,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset("assets/images/start_reword.svg"),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    LinearPercentIndicator(
                      curve: Curves.easeIn,
                      lineHeight: 10.0,
                      percent: (() {
                        final parsedValue = double.tryParse(percent.toString()) ?? 0.0;
                        return (parsedValue >= 0 && parsedValue <= 1) ? parsedValue : 0.0;
                      })(),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.black,
                      barRadius: Radius.circular(25),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '⁠Collect ${collect.toString()} stars to get this reward',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
