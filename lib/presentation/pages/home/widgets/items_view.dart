import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/cart/item_detailed.dart/item_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ItemsView extends StatelessWidget {
  ItemsView({super.key, required this.categories, this.longPress});

  final List<String> categories;
  Function()? longPress;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ProductController>();
    return FutureBuilder(
        future: controller.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.productData.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                final data = controller.productData[index];
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
                            Image.network(
                              data.imageurl![0],
                              fit: BoxFit.cover,
                              height: 120,
                              width: 120,
                            ),
                            Text(
                              data.productname!,
                              style: mediumHead,
                            ),
                            const Text(
                              'small detail',
                              style: smallHead,
                            ),
                            khight,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "₹${data.baseprice.toString()}",
                                  style:
                                      mainHead.copyWith(fontFamily: 'Roboto'),
                                ),
                                const Icon(
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
        });
  }
}
