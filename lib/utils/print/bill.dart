import 'dart:developer';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:order_repository/order_repository.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:image/image.dart' as image;

class TBill {
  TBill._();

  Future<List<int>> print(OrderModel order) async {
    List<int> bytes = [];
    // Using default profile
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    final profiles = await CapabilityProfile.getAvailableProfiles();
    log('profiles: $profiles');
    bytes += generator.reset();

    bytes += generator.text(
      "warmindo cak tho".toUpperCase(),
      styles: const PosStyles(
        bold: true,
        align: PosAlign.center,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
    );

    bytes += generator.text(
      'Tebet, Jakarta Selatan, DKI Jakarta',
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );
    bytes += generator.hr();

    bytes += generator.text(
      "ORDER #${order.no}".toUpperCase(),
      styles: const PosStyles(
        bold: true,
        align: PosAlign.center,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
    );
    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
          text: "Kasir:",
          width: 3,
          styles: const PosStyles(align: PosAlign.left)),
      PosColumn(
          text: "Dimas",
          width: 3,
          styles: const PosStyles(align: PosAlign.left, bold: true)),
      PosColumn(
        text:
            order.tableId == null ? "Dibungkus" : "Dine In ${order.table!.no}",
        width: 6,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
          text: "Struk:",
          width: 3,
          styles: const PosStyles(align: PosAlign.left)),
      PosColumn(
          text: "GS731",
          width: 3,
          styles: const PosStyles(align: PosAlign.left, bold: true)),
      PosColumn(
        text: DateFormat("dd/MM/yyyy").format(
          DateTime.parse(order.createdAt).toLocal(),
        ),
        width: 6,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: DateFormat("HH:mm").format(
          DateTime.parse(order.createdAt).toLocal(),
        ),
        width: 12,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);

    bytes += generator.hr(linesAfter: 1);

    bytes += generator.row([
      PosColumn(
        text: "Item",
        width: 6,
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
      PosColumn(
          text: "Qty",
          width: 3,
          styles: const PosStyles(align: PosAlign.left, bold: true)),
      PosColumn(
        text: "Harga",
        width: 3,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.hr();

    // Item loop start
    order.items.forEach((item) {
      bytes += generator.row([
        PosColumn(
          text: item.product.name,
          width: 6,
          styles: const PosStyles(
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: "${item.quantity}",
          width: 3,
          styles: const PosStyles(
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: TFormatter.formatToRupiah(double.parse(item.product.price)),
          width: 3,
          styles: const PosStyles(
            align: PosAlign.right,
          ),
        ),
      ]);
      if (item.notes != null || item.notes!.isNotEmpty) {
        bytes += generator.text("  ${item.notes}");
      }
    });

    // bytes += generator.row([
    //   PosColumn(
    //     text: "Nama Item#2",
    //     width: 6,
    //     styles: const PosStyles(
    //       align: PosAlign.left,
    //     ),
    //   ),
    //   PosColumn(
    //     text: "x1",
    //     width: 3,
    //     styles: const PosStyles(
    //       align: PosAlign.left,
    //     ),
    //   ),
    //   PosColumn(
    //     text: TFormatter.formatToRupiah(5000),
    //     width: 3,
    //     styles: const PosStyles(
    //       align: PosAlign.right,
    //     ),
    //   ),
    // ]);
    // bytes += generator.row([
    //   PosColumn(
    //     text: "Nama Item#3",
    //     width: 6,
    //     styles: const PosStyles(
    //       align: PosAlign.left,
    //     ),
    //   ),
    //   PosColumn(
    //     text: "x1",
    //     width: 3,
    //     styles: const PosStyles(
    //       align: PosAlign.left,
    //     ),
    //   ),
    //   PosColumn(
    //     text: TFormatter.formatToRupiah(10000),
    //     width: 3,
    //     styles: const PosStyles(
    //       align: PosAlign.right,
    //     ),
    //   ),
    // ]);
    // // Item loop end

    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
        text: "Subtotal",
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(double.parse(order.price)),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: "Pajak(5%)",
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(10000),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: "Service Charge(2%)",
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(4000),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: "Total",
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
          bold: true,
        ),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(20000),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
          bold: true,
        ),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: "Cash (Tunai)",
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(50000),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: "Kembalian",
        width: 6,
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(30000),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
          bold: true,
        ),
      ),
    ]);
    bytes += generator.hr();
    bytes += generator.text("Close Bill: 28/12/2024 - 21:37",
        styles: const PosStyles(
          align: PosAlign.center,
          bold: true,
        ));
    bytes += generator.hr();
    bytes += generator.text(
      "Terimakasih\nDitunggu kembali kedatangannya",
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );
    bytes += generator.emptyLines(1);
    bytes += generator.text(
      "Supported by",
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );
    final ByteData data = await rootBundle.load('assets/logos/lakoe-bw.png');
    final Uint8List bytesImg = data.buffer.asUint8List();
    final img = image.decodeImage(bytesImg);
    // Using `ESC *`
    bytes += generator.image(
      img!,
    );

    bytes += generator.feed(1);
    bytes += generator.cut();
    return bytes;
  }
}

class BillItem {
  final int quantity;
  final String? notes;
  final BillItemProduct product;

  BillItem({required this.quantity, required this.product, this.notes});
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

  BillCharge({required this.type, required this.name, required this.amount});
}
