import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class BillLocalization {
  static String getText(String key, String langCode) {
    Map<String, Map<String, String>> translations = {
      'en': {
        'billTitle': 'Bill',
        'totalPrice': 'Total Price',
        'date': 'Date',
        'receiptNumber': 'Receipt No',
        'cashier': 'Cashier',
        'items': 'Items',
        'subtotal': 'Subtotal',
        'discount': 'Discount',
        'tax': 'Tax',
        'serviceCharge': 'S-Charges',
        'total': 'Total',
        'paymentMethod': 'Payment Method',
        'change': 'Change',
        'approvalCode': 'Approval Code',
        'closeBill': 'Close Bill',
        'openBill': 'Open Bill',
        'supportBy': 'Supported by',
      },
      'id': {
        'billTitle': 'Struk',
        'totalPrice': 'Total Harga',
        'date': 'Tanggal',
        'receiptNumber': 'No. Struk',
        'cashier': 'Kasir',
        'items': 'Item',
        'subtotal': 'Subtotal',
        'discount': 'Diskon',
        'tax': 'Pajak',
        'serviceCharge': 'B-Layanan',
        'total': 'Total',
        'paymentMethod': 'Metode Pembayaran',
        'change': 'Kembalian',
        'approvalCode': 'Kode Approval',
        'closeBill': 'Terbayar',
        'openBill': 'Belum Dibayar',
        'supportBy': 'Didukung oleh',
      },
    };

    return translations[langCode]?[key] ?? key;
  }
}

class LanguageSwitchContainer extends StatelessWidget {
  final bool isIdLanguage;
  final Function(String) onLanguageChanged;

  const LanguageSwitchContainer({
    super.key,
    required this.isIdLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: TColors.neutralLightLight,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            width: 1,
            color: TColors.neutralLightMedium,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextHeading4(
              "Ganti ke Bahasa Indonesia?",
              color: TColors.neutralDarkDarkest,
            ),
            SizedBox(
              height: 28,
              child: Switch(
                value: isIdLanguage,
                onChanged: (value) {
                  String newLang = value ? 'id' : 'en';
                  onLanguageChanged(newLang);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
