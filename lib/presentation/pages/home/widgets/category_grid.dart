import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    required this.categories,
    this.index,
  });

  final List<String> categories;
  final index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          maxRadius: 30,
          child: Image(
              image: AssetImage(
                  'asset/images/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png')),
        ),
        khight,
        Text(categories[index]),
      ],
    );
  }
}
