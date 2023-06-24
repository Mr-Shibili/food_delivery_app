import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/category_grid.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/category_list.dart';

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
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => SizedBox(
          width: 90,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryList(),
                  ));
            },
            child: CategoryGrid(
              categories: categories,
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
