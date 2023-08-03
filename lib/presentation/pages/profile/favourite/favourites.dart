import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/items_view.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/constants.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({super.key});
  final List<String> favorites = ['burger'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Iconsax.back_square,
              color: kggreencolor,
            ),
          ),
          title: Text(
            'Favourites',
            style: mainHead.copyWith(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white10,
        ),
        body: Placeholder());
  }
}
