import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_small.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/bill_view.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/list_price.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

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
  ];

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
              onTestPrint: () {},
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
            Flexible(
              child: Row(
                children: [
                  const TextSmall(
                    "Kasir:",
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: TextSmall(
                      cashierName,
                      isBold: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            TextSmall(
              "$orderType $noTable",
              textAlign: TextAlign.right,
              isBold: true,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  const TextSmall(
                    "No.Struk:",
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: TextSmall(
                      noBill,
                      isBold: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            TextSmall(
              dateTime,
              textAlign: TextAlign.right,
              isBold: true,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 2, bottom: 8),
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
    return Expanded(
      child: TextSmall(
        greeting,
        textAlign: TextAlign.center,
      ),
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
                    "Tes Print",
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