import 'dart:developer';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sales_cashier/utils/constants/payment_method_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:image/image.dart' as image;
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class TBill {
  TBill._();

  static double _getOrderTotal(
    List<BillItem> items,
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
        // Jika kata berikutnya melebihi batas, pindahkan ke baris berikutnya
        wrappedText += currentLine.trim() + '\n';
        currentLine = word + ' ';
      } else {
        // Tambahkan kata ke baris saat ini
        currentLine += word + ' ';
      }
    }
    // Tambahkan baris terakhir
    wrappedText += currentLine.trim();

    return wrappedText;
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
    int maxLength = 32;

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    final profiles = await CapabilityProfile.getAvailableProfiles();
    log('profiles: $profiles');
    bytes += generator.reset();

    bytes += generator.emptyLines(1);

    bytes += generator.text(
      "warmindo cak tho".toUpperCase(),
      styles: const PosStyles(
        bold: true,
        align: PosAlign.center,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
    );

    String addressOutlet =
        wordWrap("Tebet, Jakarta Selatan, DKI Jakarta", maxLength);

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
        text: table == null ? "Take Away" : "Dine In ${table.no}",
        width: 6,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
          text: "Cashier:",
          width: 4,
          styles: const PosStyles(align: PosAlign.left)),
      PosColumn(
          text: operator.name,
          width: 8,
          styles: const PosStyles(align: PosAlign.right, bold: true)),
    ]);
    bytes += generator.row([
      PosColumn(
          text: "Receipt No:",
          width: 5,
          styles: const PosStyles(align: PosAlign.left)),
      PosColumn(
          text: "LK-00001",
          width: 7,
          styles: const PosStyles(align: PosAlign.right, bold: true)),
    ]);
    bytes += generator.row([
      PosColumn(
          text: "Order Date:",
          width: 5,
          styles: const PosStyles(align: PosAlign.left)),
      PosColumn(
        text: DateFormat("dd/MM/yyyy, HH:mm").format(
          DateTime.parse(order.createdAt).toLocal(),
        ),
        width: 7,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);

    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
        text: "Item",
        width: 5,
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
      PosColumn(
          text: "Qty",
          width: 2,
          styles: const PosStyles(align: PosAlign.right, bold: true)),
      PosColumn(
        text: "Harga",
        width: 5,
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
      if (item.notes != null ||
          (item.notes != null && item.notes!.isNotEmpty)) {
        bytes += generator.text("  ${item.notes}");
      }
    }

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
          text: "${tax.name} (${tax.percentage})",
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
          text: "${charge.name} (${charge.percentage})",
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
    bytes += generator.text(
        "Close Bill: ${DateFormat("dd/MM/yyyy, HH:mm").format(
          DateTime.parse(payment.createdAt).toLocal(),
        )}",
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
    bytes += generator.image(img!);

    bytes += generator.cut(mode: PosCutMode.full);
    return bytes;
  }

  static Future<void> testPrint() async {
    bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
    if (connectionStatus) {
      List<int> ticket = await print(
        items: [
          BillItem(
              quantity: 1,
              product: BillItemProduct(name: "Kopi Hitam", price: "5000"),
              price: "39517",
              notes: "Gulanya sedikit"),
          BillItem(
            quantity: 1,
            product: BillItemProduct(name: "Es Teh", price: "5000"),
            price: "41308",
          ),
          BillItem(
            quantity: 1,
            product: BillItemProduct(name: "Mie Goreng", price: "10000"),
            price: "39517",
          ),
        ],
        operator: BillOperator(name: "Iruha"),
        order: BillOrder(
            no: "9849", createdAt: "2024-09-23T17:34:59.086Z", price: "21400"),
        outlet: BillOutlet(name: "Warung Iruha"),
        payment: BillPayment(
          paymentMethod: "CASH",
          change: "28600",
          paidAmount: "50000",
          createdAt: "2024-09-23T17:34:59.131Z",
        ),
        taxes: [
          BillTax(
            type: "TAX",
            name: "PB1",
            percentage: "5%",
            amount: "1000",
          ),
        ],
        charges: [
          BillCharge(
            type: "CHARGE",
            name: "Service",
            percentage: "2%",
            amount: "4000",
          ),
        ],
      );
      final result = await PrintBluetoothThermal.writeBytes(ticket);
      log("print result: $result");
    } else {
      log("the printer is disconnected ($connectionStatus)");
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
