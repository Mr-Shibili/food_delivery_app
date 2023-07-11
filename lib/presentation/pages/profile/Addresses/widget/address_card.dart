import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kboxStyle,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Work',
                style: mediumHead,
              ),
              PopupMenuButton(
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text('Delete'),
                        )
                      ])
            ],
          ),
          const Text(
            '7, 17th Cross, 7th Sector, HSR Layout, Bengaluru, 560034, Sector 6, HSR Layout, Bengaluru, Karnataka 560102',
            maxLines: 3,
            overflow: TextOverflow.fade,
            style: mediumHead13,
          )
        ]),
      ),
    );
  }
}
