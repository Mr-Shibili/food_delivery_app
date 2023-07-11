import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class GMap extends StatelessWidget {
  const GMap({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LocationController>();
    return Scaffold(
      body: GoogleMap(
          markers: controller.markers,
          mapType: MapType.normal,
          onMapCreated: controller.onMap,
          initialCameraPosition:
              CameraPosition(target: controller.centre, zoom: 12)),
      floatingActionButton: SizedBox(
        width: 200,
        child: GreenButton(
          text: 'Current Location',
          onPress: () async {
            await controller.determinePosition();
          },
        ),
      ),
    );
  }
}
