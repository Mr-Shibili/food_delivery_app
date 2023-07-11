import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/cart/item_detailed.dart/item_page.dart';
import 'package:iconsax/iconsax.dart';

class ItemsView extends StatelessWidget {
  ItemsView({super.key, required this.categories, this.longPress});

  final List<String> categories;
  Function()? longPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 2.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return InkWell(
          onLongPress: longPress,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailPage(),
                ));
          },
          child: Container(
            decoration: kboxStyle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        height: size.height / 7,
                        image: const AssetImage(
                          'asset/images/food-home-nanoosh-20.png',
                        )),
                    const Text(
                      'Lunch meal',
                      style: mediumHead,
                    ),
                    const Text(
                      'small detail',
                      style: smallHead,
                    ),
                    khight,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '₹299',
                          style: mainHead,
                        ),
                        Icon(
                          Iconsax.add_circle,
                          color: kggreencolor,
                        )
                      ],
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
