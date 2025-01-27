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
        // Request izin photos untuk Android 13+
        final photosStatus = await Permission.photos.request();

        // Request izin storage untuk Android <13
        final storageStatus = await Permission.storage.request();

        // Periksa apakah kedua izin diberikan
        if (photosStatus.isGranted || storageStatus.isGranted) {
          if (!context.mounted) return;
          Navigator.pop(
              context, true); // Kembalikan nilai true jika izin diberikan
        } else if (photosStatus.isPermanentlyDenied ||
            storageStatus.isPermanentlyDenied) {
          if (!context.mounted) return;
          // Tampilkan dialog agar pengguna membuka pengaturan aplikasi
          Navigator.pop(context, false);
          await openAppSettings();
        } else {
          // Jika izin ditolak sementara
          if (!context.mounted) return;
          Navigator.pop(
              context, false); // Kembalikan nilai false jika izin ditolak
        }
      },
    );
  }
}
