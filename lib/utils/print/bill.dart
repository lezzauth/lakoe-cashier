import 'dart:developer';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sales_cashier/utils/constants/payment_method_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:image/image.dart' as image;

class TBill {
  TBill._();

  static double _getOrderTotal(
    List<BillItem> items,
  ) {
    return items.fold(0, (sum, item) {
      return sum + double.parse(item.price);
    });
  }

  static Future<List<int>> print({
    required BillOrder order,
    BillTable? table,
    required BillOutlet outlet,
    required BillOperator operator,
    required List<BillItem> items,
    required List<BillCharge> charges,
    required List<BillTax> taxes,
    required BillPayment payment,
  }) async {
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
        text: table == null ? "Dibungkus" : "Dine In ${table.no}",
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
    for (var item in items) {
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
    }

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
        text: TFormatter.formatToRupiah(_getOrderTotal(items)),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);

    for (var tax in taxes) {
      bytes += generator.row([
        PosColumn(
          text: tax.name,
          width: 6,
          styles: const PosStyles(
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: TFormatter.formatToRupiah(double.parse(tax.amount)),
          width: 6,
          styles: const PosStyles(
            align: PosAlign.right,
          ),
        ),
      ]);
    }

    for (var charge in charges) {
      bytes += generator.row([
        PosColumn(
          text: charge.name,
          width: 6,
          styles: const PosStyles(
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: TFormatter.formatToRupiah(double.parse(charge.amount)),
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
    bytes += generator.row([
      PosColumn(
        text: TPaymentMethodName.getName(payment.paymentMethod),
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
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: "Kembalian",
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
    bytes +=
        generator.text("Close Bill: ${TFormatter.orderDate(payment.createdAt)}",
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

class BillOrder {
  final int no;
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

  BillCharge({
    required this.type,
    required this.name,
    required this.amount,
    this.isPercentage = false,
  });
}

class BillTax {
  final String type;
  final String name;
  final String amount;

  BillTax({required this.type, required this.name, required this.amount});
}
