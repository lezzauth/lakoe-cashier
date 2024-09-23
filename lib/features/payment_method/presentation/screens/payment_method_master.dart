import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/changes_confirmation.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
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
      isActive: true,
    ),
    _PaymentItem(
      title: "Transfer Bank",
      subTitle: "Memerlukan bukti transfer",
      isActive: true,
      lastItem: true,
    ),
  ];
  List<_PaymentItem> listPaymentMethodSecondary = [
    _PaymentItem(
      title: "QRIS",
      subTitle: "Maks. 0.4% per transaksi",
      isActive: true,
    ),
    _PaymentItem(
      title: "E-Wallet",
      subTitle: "Rp4.000 per transaksi",
      isActive: false,
    ),
    _PaymentItem(
      title: "Debit / Credit",
      subTitle: "1.5% per transaksi",
      isActive: false,
      lastItem: true,
    ),
  ];

  void _showPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ChangesConfirmation(
          messageChanges: 'pengaturan metode pembayaran',
          discardAction: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          saveAction: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Metode Pembayaran",
        handleBackButton: () => _showPopup(context),
        actions: const [
          TextButton(
            onPressed: null,
            child: TextActionL(
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
                      isActive: item.isActive,
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
                      isActive: item.isActive,
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
  final bool isActive;
  final bool lastItem;

  _PaymentItem({
    required this.title,
    required this.subTitle,
    this.isActive = false,
    this.lastItem = false,
  });
}
