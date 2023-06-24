import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class OfferCards extends StatelessWidget {
  const OfferCards({
    super.key,
    required this.categories,
    required this.size,
  });

  final List<String> categories;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
            width: 250,
            child: Card(
              color: index % 2 == 0
                  ? Colors.black
                  : const Color.fromARGB(255, 148, 16, 6),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        khight,
                        Text.rich(
                          TextSpan(
                              text: 'UPTO\n',
                              style: smallHead.copyWith(color: Colors.white),
                              children: [
                                TextSpan(
                                    text: '20% OFF\n',
                                    style: mediumHead.copyWith(
                                        color: Colors.white)),
                                TextSpan(
                                    text: 'On your first order',
                                    style:
                                        smallHead.copyWith(color: Colors.white))
                              ]),
                        ),
                        khight,
                        SizedBox(
                            width: 90,
                            height: 30,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: Text(
                                'Order Now',
                                style: smallText.copyWith(color: Colors.black),
                              ),
                            ))
                      ],
                    ),
                    Image(
                      image: const AssetImage(
                        'asset/images/food-home-nanoosh-20.png',
                      ),
                      height: size.height / 9,
                    )
                  ]),
            )),
      ),
    );
  }
}
