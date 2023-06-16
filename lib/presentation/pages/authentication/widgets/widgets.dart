import 'package:flutter/material.dart';

class Squaretile extends StatelessWidget {
  const Squaretile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey),
        child: Text('temp'));
  }
}
