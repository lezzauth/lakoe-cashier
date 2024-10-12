import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/popup_confirmation.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
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
    ),
    _PaymentItem(
      title: "QRIS Statis",
      subTitle: "QRIS yang dicetak atau dipajang",
      isActive: true,
      lastItem: true,
    ),
  ];
  List<_PaymentItem> listPaymentMethodSecondary = [
    _PaymentItem(
      title: "QRIS Dinamis",
      subTitle: "Cetak dan tampilkan untuk bayar",
      isActive: false,
    ),
    // _PaymentItem(
    //   title: "E-Wallet",
    //   subTitle: "Rp4.000 per transaksi",
    //   isActive: false,
    // ),
    _PaymentItem(
      title: "Debit/Credit",
      subTitle: "Gesek atau masukkan kartunya",
      isActive: false,
      lastItem: true,
    ),
  ];

  void _showPopupConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useSafeArea: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PopupConfirmation(
          title: "Ada yang berubah...",
          message:
              'Kamu telah melakukan perubahan pengaturan metode pembayaran.\nMau disimpan atau diabaikan?',
          labelButtonPrimary: "Simpan",
          labelButtonSecondary: "Abaikan",
          primaryAction: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          secondaryAction: () {
            Navigator.pop(context);
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
        handleBackButton: () => _showPopupConfirmation(context),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              padding: const EdgeInsets.only(top: 32),
              margin: const EdgeInsets.only(bottom: 16),
              child: const TextHeading5(
                "DIHARUSKAN PUNYA MESIN EDC",
                color: TColors.neutralDarkLightest,
                textAlign: TextAlign.left,
              ),
            ),
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
