import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class CustomChip extends StatefulWidget {
  CustomChip({
    super.key,
    required this.items,
  });

  final List items;

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: List.generate(4, (int index) {
        return ChoiceChip(
            selectedColor: kggreencolor,
            avatar: CircleAvatar(
              child: Image(
                  image: AssetImage(
                      'asset/images/purepng.com-fast-food-burgerburgerfast-foodhammeatfast-food-burgermc-donaldsburger-king-231519340212qzreu.png')),
            ),
            label: Text(widget.items[index]),
            onSelected: (bool selected) {
              setState(() {
                selectedIndex = selected ? index : null;
              });
            },
            selected: selectedIndex == index);
      }).toList(),
    );
  }
}
