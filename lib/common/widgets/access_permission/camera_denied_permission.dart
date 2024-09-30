import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sales_cashier/common/widgets/access_permission/access_permission.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class CameraDeniedPermission extends StatelessWidget {
  const CameraDeniedPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return AccessPermission(
      description:
          "Dengan menekan tombol di bawah, kamu akan diarahkan ke pengaturan aplikasi.",
      imageSrc: TImages.cameraPermission,
      title: "Akses kamera belum diberikan",
      onRequest: () {
        openAppSettings();
      },
      actionTitle: "Ke Pengaturan Aplikasi",
    );
  }
}
