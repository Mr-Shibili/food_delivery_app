import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController with ChangeNotifier {
  GoogleMapController? mapcontroller;
  LatLng centre = const LatLng(12.9716, 77.5946);
  Set<Marker> markers = {};
  Placemark pickplacemark = Placemark();
  String? currentAddress;

  onMap(controller) {
    mapcontroller = controller;
    notifyListeners();
  }

  Future<void> getCurrentLocation(LatLng position) async {
    try {
      // Request permission to access the device's location
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Handle permissions denied
        return;
      }

      // Get the current position of the device
      // Position position = await Geolocator.getCurrentPosition(
      //   desiredAccuracy: LocationAccuracy.high,
      // );

      // Get the address from the obtained latitude and longitude
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Concatenate the address components into a single string
      String address = placemarks
          .map((placemark) => placemark.street)
          .where((street) => street != null && street.isNotEmpty)
          .join(', ');

      // Update the UI with the current address

      currentAddress = address;
      //
      // log(currentAddress! + 'hhjjjj');
      notifyListeners();
    } catch (e) {
      // Handle errors
      print(e.toString());
    }
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    print(permission);

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    mapcontroller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14)));

    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude)));
    notifyListeners();
  }
}
