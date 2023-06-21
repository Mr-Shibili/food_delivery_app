import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/cart/item_detailed.dart/item_page.dart';
import 'package:iconsax/iconsax.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({
    super.key,
    required this.categories,
    required this.size,
  });

  final List<String> categories;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 2.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailPage(),
                ));
          },
          child: Container(
            height: 270,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                      height: size.height / 7,
                      image: AssetImage(
                        'asset/images/food-home-nanoosh-20.png',
                      )),
                  Text(
                    'Lunch meal',
                    style: mediumHead,
                  ),
                  Text(
                    'small seatail',
                    style: smallHead,
                  ),
                  khight,
                  Row(
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
        );
      },
    );
  }
}
