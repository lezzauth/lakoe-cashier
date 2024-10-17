import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class PaymentConfirmationScreen extends StatefulWidget {
  const PaymentConfirmationScreen({super.key});

  @override
  State<PaymentConfirmationScreen> createState() =>
      _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.neutralLightLight,
      appBar: CustomAppbar(
        title: "Selesaikan Pembayaran",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: TColors.neutralLightLightest,
                  border: Border.all(
                    color: TColors.neutralLightMedium,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBodyL(
                      "Bayar sebelum",
                      color: TColors.neutralDarkDark,
                    ),
                    Wrap(
                      spacing: 8.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        UiIcons(
                          TIcons.timer,
                          width: 20,
                          height: 20,
                          color: TColors.error,
                        ),
                        TextHeading2(
                          "23:59:58",
                          color: TColors.error,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: TColors.neutralLightLightest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextBodyM(
                          "No. Virtual Account",
                          color: TColors.neutralDarkDark,
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              width: 1,
                              color: TColors.neutralLightMedium,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 4,
                                  ),
                                  color: TColors.neutralLightLight,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        TImages.bca,
                                        width: 32,
                                        height: 32,
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: TextHeading4(
                                          "Bank BCA",
                                          color: TColors.neutralDarkDark,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      TextActionL(
                                        "Ganti",
                                        color: TColors.primary,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  color: TColors.neutralLightLightest,
                                  child: Row(
                                    children: [
                                      TextHeading2(
                                        "381659999832775",
                                        color: TColors.neutralDarkDark,
                                      ),
                                      SizedBox(width: 8),
                                      UiIcons(
                                        TIcons.copy,
                                        width: 20,
                                        height: 20,
                                        color: TColors.primary,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextBodyM(
                          "Total Tagihan",
                          color: TColors.neutralDarkDark,
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              width: 1,
                              color: TColors.neutralLightMedium,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    TextHeading2(
                                      "Rp56.250",
                                      color: TColors.neutralDarkDark,
                                    ),
                                    SizedBox(width: 8),
                                    UiIcons(
                                      TIcons.copy,
                                      width: 20,
                                      height: 20,
                                      color: TColors.primary,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12),
                              TextActionL(
                                "Lihat Detail",
                                color: TColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/payment/success",
                            arguments: {'packageName': 'PRO'},
                          );
                        },
                        child: TextActionL("Cek Status Pembayaran"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
