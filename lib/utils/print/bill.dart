import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/services.dart';
import 'package:lakoe_pos/utils/print/bill_localization.dart';
import 'package:logman/logman.dart';
import 'package:order_repository/order_repository.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/features/bill/data/arguments/template_order_model.dart';
import 'package:lakoe_pos/features/orders/data/models.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/payment_method_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:image/image.dart' as image;
import 'package:lakoe_pos/utils/helpers/bluetooth_permission.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TBill {
  TBill._();

  static double _getOrderTotal(
    List<OrderItem> items,
  ) {
    return items.fold(0, (sum, item) {
      return sum + double.parse(item.price);
    });
  }

  static String wordWrap(String text, int maxLength) {
    List<String> words = text.split(' ');
    String wrappedText = '';
    String currentLine = '';

    for (String word in words) {
      if ((currentLine + word).length > maxLength) {
        wrappedText += '${currentLine.trim()}\n';
        currentLine = '$word ';
      } else {
        currentLine += '$word ';
      }
    }
    wrappedText += currentLine.trim();

    return wrappedText;
  }

  static Future<List<int>> printAction({
    required OwnerProfileModel profileOwner,
    required OrderModel order,
    required String footNote,
    required bool isTestingMode,
  }) async {
    List<int> bytes = [];
    int maxLength = 32;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String langCode = prefs.getString('bill_language') ?? 'id';

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile, spaceBetweenRows: 1);
    bytes += generator.reset();

    if (isTestingMode) {
      bytes += generator.text(
        "[Testing Mode]",
        styles: const PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size3,
        ),
      );
      bytes += generator.emptyLines(1);
    }

    if (profileOwner.packageName != "LITE") {
      try {
        final response =
            await http.get(Uri.parse(profileOwner.outlets[0].logo));

        if (response.statusCode == 200) {
          final bytesImg = response.bodyBytes;
          final image.Image? img = image.decodeImage(bytesImg);

          if (img != null) {
            // Resize image
            final resizedImage = image.copyResize(img, width: 100);

            // Create a new image to store the final black-and-white version
            final blackWhiteImage = image.Image.from(resizedImage);

            for (int y = 0; y < resizedImage.height; y++) {
              for (int x = 0; x < resizedImage.width; x++) {
                // Access the pixel at (x, y)
                final pixel = resizedImage.getPixel(x, y);
                final alpha = pixel.a; // Extract alpha channel

                // Skip transparent pixels
                if (alpha == 0) {
                  blackWhiteImage.setPixel(
                      x,
                      y,
                      image.ColorUint8.rgb(
                          255, 255, 255)); // Transparent background
                  continue;
                }

                // Force all non-transparent pixels to black
                blackWhiteImage.setPixel(
                    x, y, image.ColorUint8.rgb(0, 0, 0)); // Black
              }
            }

            final generator =
                Generator(PaperSize.mm58, await CapabilityProfile.load());
            bytes += generator.image(blackWhiteImage);
          }
        }
      } catch (e) {
        Logman.instance.info("Error: $e");
      }
    }

    bytes += generator.text(
      profileOwner.outlets[0].name.toUpperCase(),
      styles: const PosStyles(
        bold: true,
        align: PosAlign.center,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
    );

    String addressOutlet = wordWrap(profileOwner.outlets[0].address, maxLength);

    bytes += generator.text(
      addressOutlet,
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );
    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
        text: "ORDER #${order.no}".toUpperCase(),
        width: 6,
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
      PosColumn(
        text: order.type == "DINEIN"
            ? "Dine-In ${order.table?.no ?? ""}"
            : "Take Away",
        width: 6,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
          text: "${BillLocalization.getText('cashier', langCode)}:",
          width: 4,
          styles: const PosStyles(align: PosAlign.left)),
      PosColumn(
          text: order.cashier!.operator.name,
          width: 8,
          styles: const PosStyles(align: PosAlign.right, bold: true)),
    ]);
    bytes += generator.row([
      PosColumn(
          text: "${BillLocalization.getText('receiptNumber', langCode)}:",
          width: 5,
          styles: const PosStyles(align: PosAlign.left)),
      PosColumn(
          text: TFormatter.formatBillNumber(
            order.closedAt ?? order.createdAt,
            profileOwner.outlets[0].name,
          ),
          width: 7,
          styles: const PosStyles(align: PosAlign.right, bold: true)),
    ]);
    bytes += generator.row([
      PosColumn(
          text: "${BillLocalization.getText('date', langCode)}:",
          width: 5,
          styles: const PosStyles(align: PosAlign.left)),
      PosColumn(
        text: TFormatter.billDate(order.createdAt),
        width: 7,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);

    // bytes += generator.hr();

    // bytes += generator.row([
    //   PosColumn(
    //     text: "Item",
    //     width: 5,
    //     styles: const PosStyles(align: PosAlign.left, bold: true),
    //   ),
    //   PosColumn(
    //       text: "Qty",
    //       width: 2,
    //       styles: const PosStyles(align: PosAlign.right, bold: true)),
    //   PosColumn(
    //     text: "Harga",
    //     width: 5,
    //     styles: const PosStyles(align: PosAlign.right, bold: true),
    //   ),
    // ]);

    bytes += generator.emptyLines(0);
    bytes += generator.hr(linesAfter: 1);

    // Item loop start
    for (var item in order.items) {
      bytes += generator.row([
        PosColumn(
          text: item.product.name,
          width: 6,
          styles: const PosStyles(
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: "${item.quantity}x",
          width: 1,
          styles: const PosStyles(
            align: PosAlign.right,
          ),
        ),
        PosColumn(
          text: TFormatter.formatToRupiah(double.parse(item.product.price)),
          width: 5,
          styles: const PosStyles(
            align: PosAlign.right,
          ),
        ),
      ]);
      if (item.notes!.isNotEmpty) {
        bytes += generator.text("  ${item.notes}");
      }
    }

    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
        text: BillLocalization.getText('subtotal', langCode),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(_getOrderTotal(order.items)),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);

    List<OrderSummaryChargeModel> charges = order.charges!
        .map((e) => OrderSummaryChargeModel(
              type: e.type,
              name: e.name,
              amount: e.amount,
              isPercentage: e.isPercentage,
              percentageValue: e.percentageValue.toString(),
            ))
        .toList();

    List<OrderSummaryChargeModel> taxCharges() =>
        charges.where((e) => e.type == "TAX").toList();

    List<OrderSummaryChargeModel> serviceFeeCharges() =>
        charges.where((e) => e.type == "CHARGE").toList();

    if (taxCharges().isNotEmpty) {
      for (var tax in taxCharges()) {
        bytes += generator.row([
          PosColumn(
            text:
                "${tax.name} ${tax.isPercentage ? '(${tax.percentageValue}%)' : ''}",
            width: 7,
            styles: const PosStyles(
              align: PosAlign.left,
            ),
          ),
          PosColumn(
            text: TFormatter.formatToRupiah(double.parse(tax.amount)),
            width: 5,
            styles: const PosStyles(
              align: PosAlign.right,
            ),
          ),
        ]);
      }
    }

    if (serviceFeeCharges().isNotEmpty) {
      for (var charge in serviceFeeCharges()) {
        bytes += generator.row([
          PosColumn(
            text:
                "${BillLocalization.getText('serviceCharge', langCode)} ${charge.isPercentage ? '(${charge.percentageValue}%)' : ''}",
            width: 7,
            styles: const PosStyles(
              align: PosAlign.left,
            ),
          ),
          PosColumn(
            text: TFormatter.formatToRupiah(double.parse(charge.amount)),
            width: 5,
            styles: const PosStyles(
              align: PosAlign.right,
            ),
          ),
        ]);
      }
    }

    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: BillLocalization.getText('total', langCode),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
          bold: true,
        ),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(double.parse(
          order.price,
        )),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
          bold: true,
        ),
      ),
    ]);

    if (order.transactions!.isNotEmpty) {
      Transactions payment = order.transactions![0];

      bytes += generator.row([
        PosColumn(
          text: TPaymentMethodName.getName(
            payment.paymentMethod,
            payment.paidFrom,
          ),
          width: 6,
          styles: const PosStyles(
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: TFormatter.formatToRupiah(double.parse(payment.paidAmount)),
          width: 6,
          styles: const PosStyles(
            align: PosAlign.right,
          ),
        ),
      ]);
      if (payment.approvalCode != null) {
        bytes += generator.row([
          PosColumn(
            text: BillLocalization.getText('approvalCode', langCode),
            width: 6,
            styles: const PosStyles(
              align: PosAlign.left,
            ),
          ),
          PosColumn(
            text: payment.approvalCode ?? "-",
            width: 6,
            styles: const PosStyles(
              align: PosAlign.right,
            ),
          ),
        ]);
      }
      bytes += generator.hr();
      bytes += generator.row([
        PosColumn(
          text: BillLocalization.getText('change', langCode),
          width: 6,
          styles: const PosStyles(align: PosAlign.left, bold: true),
        ),
        PosColumn(
          text: TFormatter.formatToRupiah(double.parse(payment.change)),
          width: 6,
          styles: const PosStyles(
            align: PosAlign.right,
            bold: true,
          ),
        ),
      ]);
      bytes += generator.hr();
      bytes += generator.text(
          "${BillLocalization.getText('closeBill', langCode)}: ${TFormatter.billDate(order.closedAt ?? DateTime.now().toString())}",
          styles: const PosStyles(
            align: PosAlign.center,
            bold: true,
          ));
      bytes += generator.hr();
    }

    if (order.closedAt == null) {
      bytes += generator.hr();
      bytes += generator.text(BillLocalization.getText('openBill', langCode),
          styles: const PosStyles(
            align: PosAlign.center,
            bold: true,
          ));
      bytes += generator.hr();
    }

    if (order.transactions!.isNotEmpty) {
      bytes += generator.text(
        footNote,
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      );
    } else {
      bytes += generator.text(
        "Silakan cek kembali pesanan kamu sebelum membayar.",
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      );
    }

    bytes += generator.emptyLines(1);
    bytes += generator.text(
      BillLocalization.getText('supportBy', langCode),
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );
    final ByteData data = await rootBundle.load('assets/logos/lakoe-bw.png');
    final Uint8List bytesImg = data.buffer.asUint8List();
    final img = image.decodeImage(bytesImg);
    bytes += generator.image(img!);

    bytes += generator.emptyLines(2);

    if (isTestingMode) {
      bytes += generator.emptyLines(1);
      bytes += generator.text(
        "[Testing Mode]",
        styles: const PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size3,
        ),
      );
      bytes += generator.emptyLines(2);
    }

    // bytes += generator.cut(mode: PosCutMode.partial);
    return bytes;
  }

  static Future<void> printReceipt(
    BuildContext context,
    OwnerProfileModel profile,
    OrderModel order,
    String footNote,
  ) async {
    var permissions = await TBluetoothPermission.checkPermissions();
    bool isPermissionsAllowed = ![
      permissions.bluetoothConnect,
      permissions.bluetoothScan,
      permissions.nearbyDevices
    ].contains(true);

    if (!isPermissionsAllowed) {
    } else {
      bool connectionStatus = await PrintBluetoothThermal.connectionStatus;

      if (connectionStatus) {
        List<int> ticket = await printAction(
          profileOwner: profile,
          order: order,
          footNote: footNote,
          isTestingMode: false,
        );

        await PrintBluetoothThermal.writeBytes(ticket);
      } else {
        if (!context.mounted) return;
        showModalBottomSheet(
          context: context,
          enableDrag: false,
          isDismissible: false,
          builder: (context) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) async {},
              child: CustomBottomsheet(
                hasGrabber: false,
                child: ErrorDisplay(
                  imageSrc: TImages.noPrintIllustration,
                  title: "Belum ada print yang connect, nih!",
                  description:
                      "Yuk! Sambungkan dulu print kamu di halaman Setting.",
                  actionTitlePrimary: "Atur Print",
                  onActionPrimary: () async {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/print");
                  },
                  actionTitleSecondary: "Nanti Saja",
                  onActionSecondary: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        );
      }
    }
  }

  static Future<void> testPrint(
    BuildContext context,
    OwnerProfileModel profile,
    String footNote,
  ) async {
    bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
    if (connectionStatus) {
      TemplateOrderModel templateOrder = TemplateOrderModel();

      List<int> ticket = await printAction(
        profileOwner: profile,
        order: templateOrder.order,
        footNote: footNote,
        isTestingMode: true,
      );
      final result = await PrintBluetoothThermal.writeBytes(ticket);
      log("print result: $result");
    } else {
      CustomToast.show(
        "Tidak ada printer yang tersambung.",
        position: 'bottom',
        duration: 2,
      );
    }
  }
}

class BillOrder {
  final String no;
  final String createdAt;
  final String price;

  BillOrder({
    required this.no,
    required this.createdAt,
    required this.price,
  });
}

class BillPayment {
  final String paymentMethod;
  final String change;
  final String paidAmount;
  final String createdAt;

  BillPayment({
    required this.paymentMethod,
    required this.change,
    required this.paidAmount,
    required this.createdAt,
  });
}

class BillOutlet {
  final String name;
  final String? address;

  BillOutlet({required this.name, this.address});
}

class BillTable {
  final String no;

  BillTable({required this.no});
}

class BillCustomer {
  //
}

class BillOperator {
  final String name;

  BillOperator({required this.name});
}

class BillItem {
  final int quantity;
  final String price;
  final String? notes;
  final BillItemProduct product;

  BillItem({
    required this.quantity,
    required this.product,
    this.notes,
    required this.price,
  });
}

class BillItemProduct {
  final String name;
  final String price;

  BillItemProduct({required this.name, required this.price});
}

class BillCharge {
  final String type;
  final String name;
  final String amount;
  final bool isPercentage;
  final String percentage;

  BillCharge({
    required this.type,
    required this.name,
    required this.amount,
    this.isPercentage = false,
    required this.percentage,
  });
}

class BillTax {
  final String type;
  final String name;
  final String percentage;
  final String amount;

  BillTax({
    required this.type,
    required this.name,
    required this.percentage,
    required this.amount,
  });
}
