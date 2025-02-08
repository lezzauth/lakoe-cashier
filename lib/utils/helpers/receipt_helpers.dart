import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:customer_repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/utils/helpers/image_saver.dart';
import 'package:lakoe_pos/utils/helpers/share_action.dart';
import 'package:logman/logman.dart';
import 'package:order_repository/order_repository.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/detail_receipt.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:lakoe_pos/utils/print/bill.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

final GlobalKey receiptWidgetKey = GlobalKey();

class ReceiptHelper {
  // static Future<void> captureImage({
  //   required GlobalKey receiptWidgetKey,
  //   required BuildContext context,
  //   required OrderModel order,
  //   bool save = true,
  //   bool share = false,
  // }) async {
  //   final authState = context.read<AuthCubit>().state;
  //   OwnerProfileModel? ownerProfile;

  //   if (authState is AuthReady) {
  //     ownerProfile = authState.profile;
  //   }

  //   try {
  //     RenderRepaintBoundary boundary = receiptWidgetKey.currentContext!
  //         .findRenderObject() as RenderRepaintBoundary;
  //     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  //     ByteData? byteData =
  //         await image.toByteData(format: ui.ImageByteFormat.png);
  //     Uint8List pngBytes = byteData!.buffer.asUint8List();

  //     final tempDir = await getTemporaryDirectory();
  //     final file =
  //         await File(p.join(tempDir.path, 'receipt-order-${order.no}.png'))
  //             .create();
  //     await file.writeAsBytes(pngBytes);

  //     if (save) {
  //       if (!context.mounted) return;
  //       await ImageSaver.saveImageToGallery(
  //           pngBytes, context, order.no.toString());
  //     }

  //     if (share) {
  //       await Share.shareXFiles([XFile(file.path)],
  //           text:
  //               "Terimakasih sudah mampir di ${ownerProfile!.outlets[0].name}! 😊\n\nSampai jumpa lagi di kunjungan berikutnya! ❤️");
  //     }
  //   } catch (e) {
  //     Logman.instance.error(e.toString());
  //   }
  // }

  /// **1. Fungsi untuk Capture Image dari RepaintBoundary**
  static Future<Uint8List?> captureImage(GlobalKey receiptWidgetKey) async {
    try {
      final BuildContext? widgetContext = receiptWidgetKey.currentContext;
      if (widgetContext == null) {
        Logman.instance
            .error("❌ Widget context masih null, gagal mengambil gambar.");
        return null;
      }

      RenderRepaintBoundary? boundary =
          widgetContext.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        Logman.instance.error(
            "❌ RenderRepaintBoundary masih null, widget belum dirender sepenuhnya.");
        return null;
      }

      // Pastikan rendering sudah selesai
      ui.Image image = await SchedulerBinding.instance.endOfFrame.then((_) {
        return boundary.toImage(pixelRatio: 3.0);
      });

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        Logman.instance.error("❌ ByteData dari gambar adalah null.");
        return null;
      }

      return byteData.buffer.asUint8List();
    } catch (e) {
      Logman.instance.error("❌ Error capturing image: $e");
      return null;
    }
  }

  /// **2. Fungsi untuk Menyimpan Gambar ke Galeri**
  static Future<void> saveImage(
      BuildContext context, Uint8List imageBytes, String fileName) async {
    try {
      if (!context.mounted) return;
      await ImageSaver.saveImageToGallery(imageBytes, context, fileName);
      Logman.instance.info("✅ Gambar berhasil disimpan.");
    } catch (e) {
      Logman.instance.error("❌ Error menyimpan gambar: $e");
    }
  }

  /// **3. Fungsi untuk Menyimpan Gambar ke File Sementara**
  static Future<File?> saveImageToFile(
      Uint8List imageBytes, String orderNo) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final file =
          await File(p.join(tempDir.path, 'receipt-order-$orderNo.png'))
              .create();
      await file.writeAsBytes(imageBytes);
      return file;
    } catch (e) {
      Logman.instance.error("❌ Error menyimpan gambar ke file: $e");
      return null;
    }
  }

  /// **4. Fungsi untuk Share Gambar**
  static Future<void> shareImage(
      BuildContext context, Uint8List imageBytes, OrderModel order) async {
    final authState = context.read<AuthCubit>().state;
    OwnerProfileModel? ownerProfile;

    if (authState is AuthReady) {
      ownerProfile = authState.profile;
    }

    final file = await saveImageToFile(imageBytes, order.no.toString());
    if (file == null) {
      Logman.instance.error("❌ Gagal menyimpan file sebelum share.");
      return;
    }

    try {
      await Share.shareXFiles([XFile(file.path)],
          text:
              "Terimakasih sudah mampir di ${ownerProfile!.outlets[0].name}! 😊\n\nSampai jumpa lagi di kunjungan berikutnya! ❤️");
      Logman.instance.info("✅ Gambar berhasil dibagikan.");
    } catch (e) {
      Logman.instance.error("❌ Error saat share gambar: $e");
    }
  }

  static void showDetailBill(
    BuildContext context, {
    required OwnerProfileModel profile,
    required OrderModel order,
    CustomerModel? customer,
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
              final imageBytes =
                  await ReceiptHelper.captureImage(receiptWidgetKey);

              if (!context.mounted) return;
              if (imageBytes != null) {
                await ReceiptHelper.saveImage(
                    context, imageBytes, order.no.toString());
              }
              if (!context.mounted) return;
              Navigator.pop(context);
            },
            shareAction: () async {
              final imageBytes =
                  await ReceiptHelper.captureImage(receiptWidgetKey);

              if (!context.mounted) return;
              Navigator.pop(context);

              if (imageBytes != null) {
                ShareAction.showShareBottomSheet(
                  context,
                  customer: customer,
                  order: order,
                  ownerProfile: profile,
                  imageBytes: imageBytes,
                );
              } else {
                CustomToast.show("Gagal mengambil gambar.");
              }
            },
            printReceiptAction: () {
              TBill.receiptOrderPrint(context, profile, order, footNote);
            });
      },
    );
  }
}
