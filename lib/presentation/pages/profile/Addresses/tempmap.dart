import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  LocationData? _currentLocation;
  Set<Marker> _markers = Set<Marker>();
  LatLng? lalng;
  TextEditingController streetController = TextEditingController();
  TextEditingController completeAddressController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController subLocalityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> _getCurrentLocation() async {
    // ... Same as before ...
  }

  void _addMarker(LatLng latLng) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId("selected_location"),
          position: latLng,
        ),
      );
    });

    // Fetch additional location details using reverse geocoding (Optional).
    _getAddressFromLatLng(latLng);
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    if (placemarks != null && placemarks.isNotEmpty) {
      final Placemark placemark = placemarks.first;

      // You can access various location details here, for example:
      // String name = placemark.name ?? '';
      completeAddressController.text = '';
      streetController.text = placemark.name ?? '';
      subLocalityController.text = placemark.subLocality ?? '';
      localityController.text = placemark.locality ?? '';
      postalCodeController.text = placemark.postalCode ?? '';

      // You can use these details as required for your application.
      // print(
      //     "Location details: $thoroughfare, $locality, $postalCode,$sublocality");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0), // Center of the map when loading.
          zoom: 15.0,
        ),
        myLocationEnabled: true, // Show the current location button.
        myLocationButtonEnabled: true,
        // Show the current location button.
        onTap: (latLng) {
          _addMarker(latLng);
          lalng = latLng;
        }, // Add this callback to handle tapping on the map.
        markers: _markers, // Display the selected location marker.
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: GreenButton(
          text: 'Save location ',
          onPress: () {
            // _getAddressFromLatLng(lalng!);
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        khight,
                        Text('Complete Address:'),
                        CustomTextfield(
                          hint: 'Type address',
                          inputType: TextInputType.text,
                          password: false,
                          controller: completeAddressController,
                        ),
                        Text('Street:'),
                        CustomTextfield(
                          hint: 'Type address',
                          inputType: TextInputType.text,
                          password: false,
                          controller: streetController,
                        ),
                        Text('Sublocality:'),
                        CustomTextfield(
                          hint: 'Type address',
                          inputType: TextInputType.text,
                          password: false,
                          controller: subLocalityController,
                        ),
                        Text('Locality:'),
                        CustomTextfield(
                          hint: 'Type address',
                          inputType: TextInputType.text,
                          password: false,
                          controller: localityController,
                        ),
                        Text('Postal code:'),
                        CustomTextfield(
                          hint: 'Type address',
                          inputType: TextInputType.text,
                          password: false,
                          controller: postalCodeController,
                        ),
                        khight,
                        GreenButton(
                          text: 'Save',
                          onPress: () {},
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
