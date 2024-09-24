import 'dart:developer';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:image/image.dart' as image;
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_small.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/bill_view.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/list_price.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class BillMasterScreen extends StatelessWidget {
  const BillMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BillMaster();
  }
}

class BillMaster extends StatefulWidget {
  const BillMaster({super.key});

  @override
  State<BillMaster> createState() => _BillMasterState();
}

class _BillMasterState extends State<BillMaster> {
  List<_BillPriceItem> listBillPriceItem = [
    _BillPriceItem(label: "Subtotal", price: "Rp20.000"),
    _BillPriceItem(label: "Pajak", price: "5%"),
    _BillPriceItem(label: "Service Charge", price: "2%"),
  ];

  Future<void> checkBluetoothPermissions() async {
    // Check if the required permissions are granted
    PermissionStatus bluetoothScanStatus =
        await Permission.bluetoothScan.status;
    PermissionStatus bluetoothConnectStatus =
        await Permission.bluetoothConnect.status;
    PermissionStatus nearbyDevicesStatus = await Permission.location.status;

    // If not granted, request the permissions
    if (bluetoothScanStatus.isDenied) {
      await Permission.bluetoothScan.request();
    }

    if (bluetoothConnectStatus.isDenied) {
      await Permission.bluetoothConnect.request();
    }

    if (nearbyDevicesStatus.isDenied) {
      await Permission.location.request();
    }

    // Check if permissions are permanently denied (open settings if so)
    if (bluetoothScanStatus.isPermanentlyDenied ||
        bluetoothConnectStatus.isPermanentlyDenied ||
        nearbyDevicesStatus.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> print() async {
    await checkBluetoothPermissions();
    // await Permission.bluetooth.request();
    // await Permission.nearbyWifiDevices.request();
    // await Permission.bluetoothScan.request();

    final bool result = await PrintBluetoothThermal.bluetoothEnabled;

    log('print:${await Permission.bluetooth.isGranted} | $result');

    if (await Permission.bluetooth.isGranted) {
      log('print granted');
      final List<BluetoothInfo> listResult =
          await PrintBluetoothThermal.pairedBluetooths;
      await Future.forEach(listResult, (BluetoothInfo bluetooth) {
        String name = bluetooth.name;
        String mac = bluetooth.macAdress;

        log('print granted: $name | $mac');
      });

      String mac = "86:67:7A:4A:24:72";
      final bool result =
          await PrintBluetoothThermal.connect(macPrinterAddress: mac);
      bool conexionStatus = await PrintBluetoothThermal.connectionStatus;
      if (conexionStatus) {
        // String enter = '\n';
        // await PrintBluetoothThermal.writeBytes(enter.codeUnits);
        // //size of 1-5
        // String text = "Hello $enter";
        // await PrintBluetoothThermal.writeString(
        //     printText: PrintTextSize(size: 1, text: text + " size 1"));
        // await PrintBluetoothThermal.writeString(
        //     printText: PrintTextSize(size: 2, text: text + " size 2"));
        // await PrintBluetoothThermal.writeString(
        //     printText: PrintTextSize(size: 3, text: text + " size 3"));
        // await PrintBluetoothThermal.writeString(
        //     printText: PrintTextSize(size: 2, text: text + " size 4"));
        // await PrintBluetoothThermal.writeString(
        //     printText: PrintTextSize(size: 3, text: text + " size 5"));

        List<int> ticket = await testTicket();
        final result = await PrintBluetoothThermal.writeBytes(ticket);
        log("print result: $result");
      } else {
        log("the printer is disconnected ($conexionStatus)");
      }
      // if (!context.mounted) return;
      // Navigator.pop(context);
    } else {
      log('print not granted');
    }
  }

  Future<void> printTest() async {
    bool conecctionStatus = await PrintBluetoothThermal.connectionStatus;
    if (conecctionStatus) {
      List<int> ticket = await testTicket();
      final result = await PrintBluetoothThermal.writeBytes(ticket);
      // log("print result: $result");
    } else {
      //no connected
    }
  }

  Future<List<int>> testTicket() async {
    List<int> bytes = [];
    // Using default profile
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    final profiles = await CapabilityProfile.getAvailableProfiles();
    log('profiles: $profiles');
    //bytes += generator.setGlobalFont(PosFontType.fontA);
    bytes += generator.reset();

    // final ByteData data = await rootBundle.load('assets/mylogo.jpg');
    // final Uint8List bytesImg = data.buffer.asUint8List();
    // final image = Imag.decodeImage(bytesImg);
    // Using `ESC *`
    // bytes += generator.image(image!);

    // bytes += generator.text(
    //     'Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ',
    //     styles: PosStyles());
    // bytes += generator.text('Special 1: ñÑ àÀ èÈ éÉ üÜ çÇ ôÔ',
    //     styles: PosStyles(codeTable: 'CP1252'));
    // bytes += generator.text(
    //   'Special 2: blåbærgrød',
    //   styles: PosStyles(codeTable: 'CP1252'),
    // );

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
      "ORDER #2563".toUpperCase(),
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
        text: "Dine In T-12",
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
        text: "28/12/2024",
        width: 6,
        styles: const PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: "20:18",
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
    bytes += generator.row([
      PosColumn(
        text: "Nama Item#1",
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: "x1",
        width: 3,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(5000),
        width: 3,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);
    bytes += generator.text("   Catatan tambahan");
    bytes += generator.row([
      PosColumn(
        text: "Nama Item#2",
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: "x1",
        width: 3,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(5000),
        width: 3,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: "Nama Item#3",
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: "x1",
        width: 3,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: TFormatter.formatToRupiah(10000),
        width: 3,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);
    // Item loop end

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
        text: TFormatter.formatToRupiah(20000),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      appBar: const CustomAppbar(
        title: "Tampilan Struk (Bill)",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BillView(
            outletName: "Warmindo Cak Tho",
            outletAddress: "Tebet,Jakarta Selatan, DKI Jakarta",
            orderNumber: "2563",
            cashierName: "Dimas",
            noBill: "GS731",
            orderType: "DineIn",
            noTable: "T-12",
            dateTime: "28/12/2024 - 20:18",
            paymentMetod: 'Cash (Tunai)',
            totalPrice: "Rp20.000",
            moneyReceived: "Rp50.000",
            changeMoney: "Rp30.000",
            closeBill: "Close Bill: 28/12/2024 - 21:37",
            greeting: "Terimakasih\nDitunggu kembali kedatangannya",
            children: listBillPriceItem
                .map(
                  (item) => BillListPrice(
                    label: item.label,
                    price: item.price,
                  ),
                )
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: BillAction(
              onTestPrint: print,
              onChangeFooter: () {
                Navigator.pushNamed(context, "/bill/edit");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SectionBillInformation extends StatelessWidget {
  final String cashierName;
  final String noBill;
  final String orderType;
  final String noTable;
  final String dateTime;

  const SectionBillInformation({
    super.key,
    required this.cashierName,
    required this.noBill,
    required this.orderType,
    required this.noTable,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  const TextSmall(
                    "Kasir:",
                  ),
                  const SizedBox(width: 4),
                  TextSmall(
                    cashierName,
                    isBold: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextSmall(
                "$orderType $noTable",
                textAlign: TextAlign.right,
                isBold: true,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  const TextSmall(
                    "No.Struk:",
                  ),
                  const SizedBox(width: 4),
                  TextSmall(
                    noBill,
                    isBold: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextSmall(
                dateTime,
                textAlign: TextAlign.right,
                isBold: true,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Separator(
            color: TColors.neutralDarkDarkest,
            height: 0.5,
            dashWidth: 4.0,
          ),
        ),
      ],
    );
  }
}

class _BillPriceItem {
  final String label;
  final String price;

  _BillPriceItem({
    required this.label,
    required this.price,
  });
}

class BillGreeting extends StatelessWidget {
  final String greeting;
  const BillGreeting({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return TextSmall(
      greeting,
      textAlign: TextAlign.center,
    );
  }
}

class BillAction extends StatelessWidget {
  final Function() onTestPrint;
  final Function() onChangeFooter;

  const BillAction({
    super.key,
    required this.onChangeFooter,
    required this.onTestPrint,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: onTestPrint,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: [
                  UiIcons(
                    TIcons.printer,
                    height: 20,
                    width: 20,
                    color: TColors.neutralLightLightest,
                    onTap: () {},
                  ),
                  const TextActionL(
                    "Test Print",
                    color: TColors.neutralLightLightest,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 48,
            child: OutlinedButton(
              onPressed: onChangeFooter,
              child: const TextActionL(
                "Ubah Catatan",
                color: TColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
