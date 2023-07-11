import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/profile/Addresses/map.dart';
import 'package:food_delivery_app/presentation/pages/profile/Addresses/widget/address_card.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/constants.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

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
          'My Addresses',
          style: mainHead.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 5,
          itemBuilder: (context, index) => const AddressCard(),
        ),
      )),
      floatingActionButton: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GMap(),
                ));
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Address')),
    );
  }
}
