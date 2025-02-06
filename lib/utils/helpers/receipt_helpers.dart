// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/utils/helpers/image_saver.dart';
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
        if (!context.mounted) return;
        await ImageSaver.saveImageToGallery(
            pngBytes, context, order.no.toString());
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
            printReceiptAction: () {
              TBill.receiptOrderPrint(context, profile, order, footNote);
            });
      },
    );
  }
}
