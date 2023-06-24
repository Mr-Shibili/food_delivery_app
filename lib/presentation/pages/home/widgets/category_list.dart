import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/category_grid.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/home_search.dart';
import 'package:iconsax/iconsax.dart';

class CategoryList extends StatelessWidget {
  CategoryList({
    super.key,
  });
  final List<String> foods = [
    'Big b burger',
    'Veg burger',
    'Cheese burger',
    'Cheese burger',
    'Cheese burger',
  ];

  final TextEditingController textcontrolller = TextEditingController();

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
            'Select your meal',
            style: mainHead.copyWith(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(children: [
            HomeSearch(searchController: textcontrolller),
            khight,
            Expanded(
              child: Center(
                  child: GridView.builder(
                itemCount: foods.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 2.1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => Container(
                  decoration: kboxStyle,
                  child: CategoryGrid(categories: foods, index: index),
                ),
              )),
            ),
          ]),
        ));
  }
}
