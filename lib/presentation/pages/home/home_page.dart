import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/category_home.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/custom_bottom_navigation.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/home_search.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/offer_card.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/items_view.dart';

import 'package:iconsax/iconsax.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final TextEditingController searchController = TextEditingController();
  final List<String> categories = ['Breakfast', 'Meals', 'Dessert', 'pizza'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.yellow,
                    maxRadius: 15,
                    child: Icon(Iconsax.user4),
                  ),
                  const Icon(
                    Icons.location_on_sharp,
                    color: kggreencolor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Delivery to',
                        style: smallText,
                      ),
                      InkWell(
                        onTap: () {
                          print('inkwell clicked');
                        },
                        child: const Row(
                          children: [
                            Text(
                              'Bangaluru,Hsr layout',
                              style: smallHead,
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.notification,
                        color: kggreencolor,
                      )),
                  Badge(
                    backgroundColor: Colors.red,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Iconsax.bag_2,
                        color: kggreencolor,
                      ),
                    ),
                  )
                ],
              ),
              khight,
              HomeSearch(searchController: searchController),
              khight,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: mediumHead,
                  ),
                  Text(
                    'See all',
                    style: smallgreenText,
                  )
                ],
              ),
              khight,
              CategoryHome(categories: categories),
              OfferCards(categories: categories, size: size),
              khight,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kitchen near your',
                    style: mediumHead,
                  ),
                  Text(
                    'See all',
                    style: smallgreenText,
                  )
                ],
              ),
              khight,
              ItemsView(categories: categories, size: size)
            ],
          ),
        ),
      )),
    );
  }
}
