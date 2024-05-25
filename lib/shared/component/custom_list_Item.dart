import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomListItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 17.0,
                color: Color(0xFF221D1D),
                height: 2,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffC4C4C6),
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
