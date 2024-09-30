import 'package:flutter/material.dart' hide Image;
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/bill/text_small.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/bill_view.dart';
import 'package:point_of_sales_cashier/features/bill/presentation/widgets/list_price.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

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
    _BillPriceItem(label: "Pajak (5%)", price: "Rp1.000"),
    _BillPriceItem(label: "Service Charge (2%)", price: "Rp400"),
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
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                BillView(
                  outletName: "Warmindo Cak Tho",
                  outletAddress: "Tebet,Jakarta Selatan, DKI Jakarta",
                  orderNumber: "9849",
                  cashierName: "Dimas",
                  noBill: "LK-0001",
                  orderType: "Take Away",
                  dateTime: "28/12/2024, 20:18",
                  paymentMetod: 'Cash (Tunai)',
                  totalPrice: "Rp21.400",
                  moneyReceived: "Rp50.000",
                  changeMoney: "Rp28.600",
                  closeBill: "Close Bill: 28/12/2024, 21:37",
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
                const TextBodyS(
                  "Ini hanya contoh tampilan struk",
                  color: TColors.neutralDarkLightest,
                  fontStyle: FontStyle.italic,
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/bill/edit");
                },
                child: const TextActionL(
                  "Ubah Catatan Kaki",
                  color: TColors.primary,
                ),
              ),
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
  final String dateTime;

  const SectionBillInformation({
    super.key,
    required this.cashierName,
    required this.noBill,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: TextSmall(
                "Cashier:",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextSmall(
                cashierName,
                isBold: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: TextSmall(
                "Receipt No:",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextSmall(
                noBill,
                isBold: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: TextSmall(
                "Order Date:",
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
