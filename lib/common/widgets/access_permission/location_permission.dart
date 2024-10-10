import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sales_cashier/common/widgets/access_permission/access_permission.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class LocationPermission extends StatelessWidget {
  const LocationPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return AccessPermission(
      description:
          "Dengan ini, kamu akan bisa menggunakan fitur aplikasi yang membutuhkan lokasi.",
      imageSrc: TImages.locationPermission,
      title: "Izin untuk bisa akses lokasi kamu",
      onRequest: () async {
        final result = await Permission.location.request();

        if (!context.mounted) return;
        Navigator.pop(context, result);
      },
    );
  }
}
