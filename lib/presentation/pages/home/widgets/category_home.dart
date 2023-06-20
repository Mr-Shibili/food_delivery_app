import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => Container(
          width: 90,
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 30,
                child: Image(
                    image: AssetImage(
                        'asset/images/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png')),
              ),
              khight,
              Text(categories[index]),
            ],
          ),
        ),
      ),
    );
  }
}
