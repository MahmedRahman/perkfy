import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListTile extends StatelessWidget {
  var title;
  var subtitle;
  var icon;

  CustomListTile({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(icon),
        ),
      ), // Customizable icon
      title: Text(
        '$title',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        '$subtitle',
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 13,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ), // Adjust padding as needed
    );
  }
}
