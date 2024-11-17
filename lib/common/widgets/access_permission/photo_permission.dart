import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:lakoe_pos/common/widgets/access_permission/access_permission.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class PhotosPermission extends StatelessWidget {
  const PhotosPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return AccessPermission(
      description:
          "Dengan ini, kamu akan bisa meng-upload foto & dokumen yang ada di HP.",
      imageSrc: TImages.storagePermission,
      title: "Izin untuk bisa akses galeri & penyimpanan HP kamu",
      onRequest: () async {
        await Permission.photos.request();

        if (await Permission.photos.isGranted) {
          if (!context.mounted) return;
          Navigator.pop(context);
        }
      },
    );
  }
}
