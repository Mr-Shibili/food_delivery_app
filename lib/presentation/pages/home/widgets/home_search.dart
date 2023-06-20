import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:iconsax/iconsax.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5)),
          prefixIcon: Icon(
            Iconsax.search_normal,
            color: kggreencolor,
          ),
          suffixIcon: Icon(
            Icons.filter_list_outlined,
            color: kggreencolor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          hintText: 'Search Food and Kitchen',
          contentPadding: const EdgeInsets.all(9),
          hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 14),
          filled: true,
          fillColor: Colors.grey[200]),
    );
  }
}
