import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class QrisPaymentScreen extends StatefulWidget {
  const QrisPaymentScreen({super.key});

  @override
  State<QrisPaymentScreen> createState() => _QrisPaymentScreenState();
}

class _QrisPaymentScreenState extends State<QrisPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      appBar: CustomAppbar(
        title: "Tagih Pembayaran",
        leading: Transform.translate(
          offset: const Offset(-16, 0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const UiIcons(
              TIcons.close,
              height: 20,
              width: 20,
              color: TColors.primary,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 36),
              decoration: BoxDecoration(
                color: TColors.neutralLightLightest,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 4),
                              child: TextBodyS(
                                "Total Tagihan",
                                color: TColors.neutralDarkLight,
                              ),
                            ),
                            TextHeading2(
                              TFormatter.formatToRupiah(20000),
                              color: TColors.neutralDarkDarkest,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32,
                          child: OutlinedButton(
                            style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const TextActionL(
                              "Download",
                              color: TColors.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Separator(
                    color: TColors.neutralLightMedium,
                    height: 1,
                    dashWidth: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: TextBodyS(
                      "Tunjukan QR Code ini kepada pelanggan untuk menerima pembayaran.",
                      color: TColors.neutralDarkDarkest,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 352,
                    width: 295,
                    child: Container(
                      color: TColors.neutralLightLight,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    margin: EdgeInsets.only(bottom: 8),
                    child: TextBodyS(
                      "Menunggu Pembayaran",
                      color: TColors.neutralDarkLight,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextBodyS(
                "Jangan tutup atau keluar dari halaman ini sebelum pembayaran berhasil.",
                color: TColors.neutralDarkLight,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const TextActionL(
                        "Cetak QRIS",
                        color: TColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const TextActionL(
                        "Cek Pembayaran",
                        color: TColors.neutralLightLightest,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
