import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:lakoe_pos/common/widgets/access_permission/access_permission.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class CameraPermission extends StatelessWidget {
  const CameraPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return AccessPermission(
      description:
          "Dengan ini, kamu akan bisa menggunakan fitur aplikasi yang membutuhkan kamera.",
      imageSrc: TImages.cameraPermission,
      title: "Izin untuk bisa akses kamera kamu",
      onRequest: () async {
        await Permission.camera.request();

        if (await Permission.camera.isGranted) {
          if (!context.mounted) return;
          Navigator.pop(context);
        }
      },
    );
  }
}
