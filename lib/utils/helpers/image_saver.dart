import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lakoe_pos/common/widgets/access_permission/photo_permission.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:logman/logman.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageSaver {
  static const _channel = MethodChannel("com.lakoe.app/media");

  static Future<void> saveImageToGallery(
    Uint8List pngBytes,
    BuildContext context,
    String orderNumber,
  ) async {
    final String fileName = 'receipt-order-#$orderNumber.png';

    try {
      if (!(await _hasPermissions())) {
        if (!context.mounted) return;

        final bool shouldProceed = await showModalBottomSheet<bool>(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const CustomBottomsheet(
                  child: PhotosPermission(),
                );
              },
            ) ??
            false;

        if (!shouldProceed) {
          return;
        }
      }

      if (await _checkAndRequestPermission()) {
        final bool result = await _channel.invokeMethod("saveImageToGallery", {
          "bytes": pngBytes,
          "fileName": fileName,
        });

        if (result) {
          CustomToast.show(
            'Struk berhasil disimpan!',
            backgroundColor: TColors.neutralDarkDark,
            position: "bottom",
          );
        } else {
          CustomToast.show(
            'Gagal menyimpan gambar!',
            backgroundColor: TColors.error,
            position: "bottom",
          );
        }
      } else {
        CustomToast.show(
          'Izin diperlukan untuk menyimpan gambar',
          backgroundColor: TColors.warning,
          position: "bottom",
        );
      }
    } catch (e) {
      Logman.instance.error('Error saving image: $e');
      CustomToast.show(
        'Terjadi kesalahan!',
        backgroundColor: TColors.error,
        position: "bottom",
      );
    }
  }

  static Future<bool> _hasPermissions() async {
    final photosStatus = await Permission.photos.status;
    final storageStatus = await Permission.storage.status;

    return photosStatus.isGranted || storageStatus.isGranted;
  }

  static Future<bool> _checkAndRequestPermission() async {
    if (await Permission.photos.isGranted ||
        await Permission.storage.isGranted) {
      return true;
    }

    if (await Permission.photos.isPermanentlyDenied ||
        await Permission.storage.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    if (await Permission.storage.request().isGranted ||
        await Permission.photos.request().isGranted) {
      return true;
    }

    return false;
  }
}
