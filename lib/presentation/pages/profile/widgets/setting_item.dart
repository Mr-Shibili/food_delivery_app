import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onPress,
  });
  final Icon icon;
  final String text;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: kboxStyle2,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(children: [
            icon,
            kwidth,
            Text(
              text,
              style: mediumHead13,
            )
          ]),
        ),
      ),
    );
  }
}
