import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/cart/widget/item_count_manager.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  String title = 'Cart';
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
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => khight,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: ValueKey(index),
                      background: Container(
                        color: Colors.red,
                        child: const Icon(
                          Iconsax.trash,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.startToEnd) {
                          items.removeAt(index);
                        }
                      },
                      child: Container(
                        decoration: kboxStyle,
                        child: ListTile(
                          leading: const CircleAvatar(
                            maxRadius: 35,
                            child: Image(
                                image: AssetImage(
                                    'asset/images/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png')),
                          ),
                          title: Text('Chicken burger large  ${items[index]}'),
                          subtitle: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Burger&salads'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('₹399'),
                                    CartItemController()
                                  ],
                                ),
                                khight
                              ]),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      decoration: kboxStyle,
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Iconsax.ticket_discount,
                              color: kggreencolor,
                            ),
                            Text(
                              'Add Promo code',
                              style: mainHead,
                            ),
                            Icon(
                              Iconsax.arrow_right,
                              color: kggreencolor,
                            ),
                          ]),
                    ),
                    Container(
                      height: 130,
                      decoration: kboxStyle,
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: smallText,
                                  ),
                                  khight,
                                  Text(
                                    'Delivery fee',
                                    style: smallText,
                                  ),
                                  khight,
                                  Text(
                                    'Discount',
                                    style: smallText,
                                  ),
                                  khight,
                                  Text(
                                    'Total',
                                    style: mediumHead,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₹200',
                                    style: smallText,
                                  ),
                                  khight,
                                  Text(
                                    '₹30',
                                    style: smallText,
                                  ),
                                  khight,
                                  Text(
                                    '₹30',
                                    style: smallText,
                                  ),
                                  khight,
                                  Text(
                                    '₹500',
                                    style: mediumHead,
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ),
                    GreenButton(
                      text: 'Proceed Order',
                      onPress: () {},
                    ),
                    khight
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
