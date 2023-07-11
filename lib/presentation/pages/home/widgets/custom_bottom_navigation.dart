import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/Orders/orders.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/home_page.dart';
import 'package:iconsax/iconsax.dart';

import '../../profile/settings.dart';

class CustomBottomnavigation extends StatefulWidget {
  const CustomBottomnavigation({
    super.key,
  });

  @override
  State<CustomBottomnavigation> createState() => _CustomBottomnavigationState();
}

class _CustomBottomnavigationState extends State<CustomBottomnavigation> {
  int pageindex = 0;

  final pages = [
    MyHomePage(),
    OrdersPage(),
    MyHomePage(),
    MyHomePage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageindex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kggreencolor,
          unselectedItemColor: Colors.black,
          currentIndex: pageindex,
          onTap: (value) {
            setState(() {
              pageindex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                backgroundColor: Colors.grey[200],
                icon: const Icon(
                  Iconsax.home,
                  color: Colors.black,
                )),
            const BottomNavigationBarItem(
                label: 'Orders',
                icon: Icon(
                  Iconsax.receipt_item,
                  color: Colors.black,
                )),
            const BottomNavigationBarItem(
                label: 'Message',
                icon: Icon(
                  Iconsax.message,
                  color: Colors.black,
                )),
            const BottomNavigationBarItem(
                label: 'Wallet',
                icon: Icon(
                  Iconsax.wallet,
                  color: Colors.black,
                )),
            const BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  Iconsax.user,
                  color: Colors.black,
                )),
          ]),
    );
  }
}
