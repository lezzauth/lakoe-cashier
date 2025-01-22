// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:order_repository/order_repository.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:lakoe_pos/common/widgets/access_permission/photo_denied_permission.dart';
import 'package:lakoe_pos/common/widgets/access_permission/photo_permission.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/detail_receipt.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/print/bill.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

final GlobalKey receiptWidgetKey = GlobalKey();

class ReceiptHelper {
  static Future<void> captureImage({
    required GlobalKey receiptWidgetKey,
    required BuildContext context,
    required OrderModel order,
    bool save = true,
    bool share = false,
  }) async {
    final authState = context.read<AuthCubit>().state;
    OwnerProfileModel? ownerProfile;

    if (authState is AuthReady) {
      ownerProfile = authState.profile;
    }

    try {
      RenderRepaintBoundary boundary = receiptWidgetKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file =
          await File(p.join(tempDir.path, 'receipt-order-${order.no}.png'))
              .create();
      await file.writeAsBytes(pngBytes);

      if (save) {
        // ignore: use_build_context_synchronously
        await saveImageToGallery(pngBytes, context, order);
      }

      if (share) {
        await Share.shareXFiles([XFile(file.path)],
            text:
                "Terimakasih sudah mampir di ${ownerProfile!.outlets[0].name}! 😊\n\nSampai jumpa lagi di kunjungan berikutnya! ❤️");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> saveImageToGallery(
    Uint8List pngBytes,
    BuildContext context,
    OrderModel order,
  ) async {
    if (await Permission.photos.isPermanentlyDenied) {
      showModalBottomSheet(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) {
          return CustomBottomsheet(
            child: const PhotoDeniedPermission(),
          );
        },
      );

      return;
    }

    if (!(await Permission.photos.isGranted)) {
      await showModalBottomSheet(
        // ignore: use_build_context_synchronously
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return const CustomBottomsheet(
            child: PhotosPermission(),
          );
        },
      );
    } else if (await _requestPermission()) {
      try {
        Directory? picturesDir =
            Directory('/storage/emulated/0/Pictures/Lakoe');

        if (!await picturesDir.exists()) {
          await picturesDir.create(recursive: true);
        }

        String fileName = 'receipt-order-${order.no}.png';
        String filePath = p.join(picturesDir.path, fileName);

        File imgFile = File(filePath);
        await imgFile.writeAsBytes(pngBytes);

        final result = await ImageGallerySaver.saveFile(filePath);

        if (result['isSuccess'] == true || result['success'] == true) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Gambar struk berhasil disimpan'),
              duration: Duration(seconds: 3),
              backgroundColor: TColors.neutralDarkDark,
            ),
          );
        } else {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Gagal menyimpan gambar!'),
              duration: Duration(seconds: 3),
              backgroundColor: TColors.error,
            ),
          );
        }
      } catch (e) {
        print('Error saving image: $e');
      }
    }
  }

  static Future<bool> _requestPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted) {
        return true;
      } else if (await Permission.manageExternalStorage.request().isGranted) {
        return true;
      }
    }
    return false;
  }

  static void showDetailBill(
    BuildContext context, {
    required OwnerProfileModel profile,
    required OrderModel order,
    required String footNote,
    required ScrollController scrollController,
  }) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DetailReceiptBottomSheet(
            controller: scrollController,
            widgetKey: receiptWidgetKey,
            data: order,
            saveAction: () async {
              await ReceiptHelper.captureImage(
                context: context,
                order: order,
                receiptWidgetKey: receiptWidgetKey,
              );
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            shareAction: () {
              ReceiptHelper.captureImage(
                context: context,
                order: order,
                receiptWidgetKey: receiptWidgetKey,
                save: false,
                share: true,
              );
              Navigator.pop(context);
            },
            printAction: () {
              TBill.printReceipt(context, profile, order, footNote);
            });
      },
    );
  }
}
