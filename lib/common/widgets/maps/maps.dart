import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng? pinpoint;

  static const CameraPosition _monas = CameraPosition(
    target: LatLng(-6.174651980000515, 106.82686608284712),
    zoom: 10,
  );

  Future<void> _onMapTap(LatLng argument) async {
    setState(() {
      pinpoint = argument;
    });
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(argument.latitude, argument.longitude);

      log(placemarks.first.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Cari lokasi",
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _monas,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: _onMapTap,
        markers: {
          if (pinpoint != null)
            Marker(markerId: MarkerId("user-pinpoint"), position: pinpoint!)
        },
        myLocationEnabled: true,
      ),
    );
  }
}
