import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 30,
      decoration: kboxStyle1,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          icon,
          color: const Color.fromARGB(255, 244, 210, 59),
          size: 18,
        ),
        Text(
          text,
          style: smallTextBlack,
        )
      ]),
    );
  }
}
