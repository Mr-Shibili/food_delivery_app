import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/cart/item_detailed.dart/widget/chip.dart';
import 'package:food_delivery_app/presentation/pages/home/cart/item_detailed.dart/widget/widgets.dart';
import 'package:food_delivery_app/presentation/pages/home/cart/widget/item_count_manager.dart';
import 'package:iconsax/iconsax.dart';

class ItemDetailPage extends StatelessWidget {
  ItemDetailPage({super.key});
  String title = 'Food';
  String text = '4.5';
  String text2 = '300 cal';
  String text3 = '15-20 min';
  final icon = Icons.star;
  final icon2 = Icons.local_fire_department;
  final icon3 = Icons.access_time_filled;
  //int? selectedIndex;

  List items = ['one', 'two', 'three', 'four', 'five'];

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
          title,
          style: mainHead.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Iconsax.menu_1,
            color: kggreencolor,
          ),
          kwidth
        ],
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: SafeArea(
          child: Column(
        children: [
          const Expanded(
            child: Image(
                image: AssetImage(
                    'asset/images/purepng.com-fast-food-burgerburgerfast-foodhammeatfast-food-burgermc-donaldsburger-king-231519340212qzreu.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Container(
              decoration: kboxStyle,
              height: 500,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    khight20,
                    const Center(
                      child: SizedBox(
                          height: 40, width: 140, child: CartItemController()),
                    ),
                    khight,
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'The Cheese burger',
                          style: mediumHead,
                        ),
                        const Spacer(),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Iconsax.heart5,
                            color: kredcolor,
                          ),
                        ),
                        kwidth
                      ],
                    ),
                    khight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconWithText(icon: icon, text: text),
                        IconWithText(icon: icon2, text: text2),
                        IconWithText(icon: icon3, text: text3)
                      ],
                    ),
                    khight,
                    const Text(
                      "Details",
                      style: mainHead,
                    ),
                    khight,
                    const Text(
                      'details of food ',
                      style: smallgrey12,
                    ),
                    khight,
                    const Text(
                      "Topping for you",
                      style: mainHead,
                    ),
                    khight,
                    const Text(
                      'Choose your best pair',
                      style: smallgrey12,
                    ),
                    khight,
                    CustomChip(items: items),
                    khight40,
                    GreenButton(
                      text: 'Add to cart',
                      onPress: () {},
                    ),
                    khight
                  ]),
            ),
          )
        ],
      )),
    );
  }
}
