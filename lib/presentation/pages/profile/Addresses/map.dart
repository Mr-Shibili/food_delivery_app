import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';

// ignore: must_be_immutable
class GMap extends StatelessWidget {
  const GMap({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LocationController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Iconsax.back_square,
            color: kggreencolor,
          ),
        ),
        title: Text(
          'Pick Address',
          style: mainHead.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: GoogleMap(
          onTap: (argument) {
            controller.getCurrentLocation(argument);
          },
          markers: controller.markers,
          mapType: MapType.normal,
          onMapCreated: controller.onMap,
          initialCameraPosition:
              CameraPosition(target: controller.centre, zoom: 12)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CircleAvatar(
          backgroundColor: Colors.green,
          maxRadius: 30,
          child: IconButton(
              onPressed: () async {
                await controller.determinePosition();
              },
              icon: const Icon(
                Icons.location_history,
                size: 30,
                color: Colors.white,
              ))),
    );
  }
}
