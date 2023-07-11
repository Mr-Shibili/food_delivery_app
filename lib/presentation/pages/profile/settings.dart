import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/profile_controller.dart';
import 'package:food_delivery_app/model/user_model.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/profile/Addresses/addresses.dart';
import 'package:food_delivery_app/presentation/pages/profile/favourite/favourites.dart';
import 'package:food_delivery_app/presentation/pages/profile/profile_details/profile_view_and_edit.dart';
import 'package:food_delivery_app/presentation/pages/profile/widgets/setting_item.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileController>().getUser();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile&Settings',
          style: mainHead.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileViewAndEdit(),
                      ));
                },
                child: Container(
                  decoration: kboxStyle1,
                  // height: 100,
                  child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Consumer<ProfileController>(
                          builder: (context, snapShot, _) {
                        //snapShot.getUser();

                        if (snapShot.user != null) {
                          final UserModel data = snapShot.user!;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.username!,
                                style: mediumHead,
                              ),
                              CircleAvatar(
                                  minRadius: 30,
                                  backgroundImage: NetworkImage(data.profile!))
                            ],
                          );
                        } else {
                          return const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'UserName',
                                style: mediumHead,
                              ),
                              CircleAvatar(
                                minRadius: 30,
                                child: Icon(Icons.person),
                              )
                            ],
                          );
                        }
                      })),
                )),
            khight,
            Container(
              decoration: kboxStyle1,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(children: [
                  SettingItem(
                    icon: const Icon(Iconsax.star),
                    text: 'Favourites',
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavouritePage(),
                          ));
                    },
                  ),
                  khight,
                  SettingItem(
                    icon: const Icon(Iconsax.building_3),
                    text: "Addresses",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddressesPage(),
                          ));
                    },
                  )
                ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}
