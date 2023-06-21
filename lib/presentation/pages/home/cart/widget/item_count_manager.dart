import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class CartItemController extends StatefulWidget {
  const CartItemController({
    super.key,
  });

  @override
  State<CartItemController> createState() => _CartItemControllerState();
}

class _CartItemControllerState extends State<CartItemController> {
  int item = 1;
  void countPlus() {
    if (item >= 50) {
      print('error adding item');
    } else {
      item++;
    }
  }

  void countMinus() {
    if (item <= 1) {
      print('should be more than 1');
    } else {
      item--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.green[200]),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
            onPressed: () {
              countMinus();
              setState(() {});
            },
            icon: Icon(Icons.remove)),
        kwidth,
        Text(item.toString()),
        kwidth,
        IconButton(
            onPressed: () {
              countPlus();
              setState(() {});
            },
            icon: Icon(Icons.add))
      ]),
    );
  }
}
