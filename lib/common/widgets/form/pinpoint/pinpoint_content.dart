import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/device/device_uility.dart';

class PinpointContent extends StatefulWidget {
  const PinpointContent({super.key, this.value, required this.onChanged});

  final LatLng? value;
  final ValueChanged<LatLng> onChanged;

  @override
  State<PinpointContent> createState() => _PinpointContentState();
}

class _PinpointContentState extends State<PinpointContent> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng? pinpoint;

  static const CameraPosition _monas = CameraPosition(
    target: LatLng(-6.174651980000515, 106.82686608284712),
    zoom: 15,
  );

  Future<void> _onMapTap(LatLng argument) async {
    widget.onChanged(argument);

    setState(() {
      pinpoint = argument;
    });
  }

  Future<void> _getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(
      accuracy: LocationAccuracy.high,
    ));

    final newPinpoint = LatLng(position.latitude, position.longitude);

    setState(() {
      pinpoint = newPinpoint;
    });

    widget.onChanged(newPinpoint);

    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newLatLng(newPinpoint));
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      pinpoint = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TDeviceUtils.getViewInsets(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 8),
              clipBehavior: Clip.antiAlias,
              height: 300,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _monas,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onTap: _onMapTap,
                markers: {
                  if (pinpoint != null)
                    Marker(
                        markerId: MarkerId("user-pinpoint"),
                        position: pinpoint!)
                },
              ),
            ),
            OutlinedButton(
              onPressed: _getCurrentPosition,
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: [
                  UiIcons(
                    TIcons.gps,
                    color: TColors.primary,
                  ),
                  TextBodyM(
                    "Gunakan Lokasi Saat Ini",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
