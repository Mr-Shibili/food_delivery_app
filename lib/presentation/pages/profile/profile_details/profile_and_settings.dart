import 'package:flutter/material.dart';

class ProfileAndSettings extends StatelessWidget {
  const ProfileAndSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [CircleAvatar()]),
      )),
    );
  }
}
