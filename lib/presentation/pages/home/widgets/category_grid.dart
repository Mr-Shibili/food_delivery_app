import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/catebory_model.dart';

import '../../constants/constants.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    required this.categories,
    this.index,
  });

  final List<CategoryModel> categories;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          maxRadius: 30,
          backgroundImage: NetworkImage(categories[index!].logo!),
        ),
        khight,
        Text(categories[index!].name!),
      ],
    );
  }
}
