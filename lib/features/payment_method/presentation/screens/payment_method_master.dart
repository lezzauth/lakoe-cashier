import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/features/payment_method/presentation/widgets/section/section_card.dart';
import 'package:point_of_sales_cashier/features/payment_method/presentation/widgets/section/section_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class PaymentMethodMasterScreen extends StatelessWidget {
  const PaymentMethodMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentMethodMaster();
  }
}

class PaymentMethodMaster extends StatefulWidget {
  const PaymentMethodMaster({super.key});

  @override
  State<PaymentMethodMaster> createState() => _PaymentMethodMasterState();
}

class _PaymentMethodMasterState extends State<PaymentMethodMaster> {
  List<_PaymentItem> listPaymentMethodPrimary = [
    _PaymentItem(
      title: "Tunai/Cash",
      subTitle: "Pembayaran secara langsung",
      isAction: true,
    ),
    _PaymentItem(
      title: "Transfer Bank",
      subTitle: "Memerlukan bukti transfer",
      isAction: true,
      lastItem: true,
    ),
  ];
  List<_PaymentItem> listPaymentMethodSecondary = [
    _PaymentItem(
      title: "QRIS",
      subTitle: "Maks. 0.4% per transaksi",
      isAction: true,
    ),
    _PaymentItem(
      title: "E-Wallet",
      subTitle: "Rp4.000 per transaksi",
      isAction: false,
    ),
    _PaymentItem(
      title: "Debit / Credit",
      subTitle: "1.5% per transaksi",
      isAction: false,
      lastItem: true,
    ),
  ];

  void _showPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return const PopupContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Metode Pembayaran",
        actions: [
          TextButton(
            onPressed: () {
              _showPopup(context);
            },
            child: const TextActionL(
              "SIMPAN",
              color: TColors.primary,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Column(
          children: [
            PaymentSectionCard(
              children: listPaymentMethodPrimary
                  .map(
                    (item) => PaymentSectionItem(
                      title: item.title,
                      subTitle: item.subTitle,
                      isAction: item.isAction,
                      lastItem: item.lastItem,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            PaymentSectionCard(
              children: listPaymentMethodSecondary
                  .map(
                    (item) => PaymentSectionItem(
                      title: item.title,
                      subTitle: item.subTitle,
                      isAction: item.isAction,
                      lastItem: item.lastItem,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentItem {
  final String title;
  final String subTitle;
  final bool isAction;
  final bool lastItem;

  _PaymentItem({
    required this.title,
    required this.subTitle,
    this.isAction = false,
    this.lastItem = false,
  });
}

class PopupContent extends StatefulWidget {
  const PopupContent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PopupContentState createState() => _PopupContentState();
}

class _PopupContentState extends State<PopupContent> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[600],
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: TColors.neutralLightLightest,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TextHeading2(
              'Ada yang berubah...',
            ),
            const SizedBox(height: 8),
            const TextBodyM(
              'Kamu telah melakukan perubahan pengaturan metode pembayaran. Apa kamu yakin mau membatalkannya?',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const TextActionL(
                        "Ya, Batalkan",
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const TextActionL(
                        "Tidak",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
