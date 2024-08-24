import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/payments/data/arguments/bank_transfer_payment_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:point_of_sales_cashier/utils/helpers/helper.dart';

class BankTransferPaymentScreen extends StatefulWidget {
  const BankTransferPaymentScreen({super.key});

  @override
  State<BankTransferPaymentScreen> createState() =>
      _BankTransferPaymentScreenState();
}

class _BankTransferPaymentScreenState extends State<BankTransferPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as BankTransferPaymentArgument;

    String formattedAmount = TFormatter.formatToRupiah(arguments.amount);
    List<String> splittedAmount = [
      formattedAmount.substring(0, formattedAmount.length - 3),
      formattedAmount.substring(formattedAmount.length - 3),
    ];

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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: TColors.neutralLightLight,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(4),
                                child: SvgPicture.asset(
                                  THelper.getBankImage(
                                      arguments.account.bankName),
                                  height: 38,
                                  width: 38,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: TextHeading4(
                                      THelper.getBankName(
                                          arguments.account.bankName),
                                      color: TColors.neutralDarkDarkest,
                                    ),
                                  ),
                                  TextBodyM(
                                    "A/n ${arguments.account.name}",
                                    color: TColors.neutralDarkDark,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Separator(
                          color: TColors.neutralLightMedium,
                          height: 1,
                          dashWidth: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 12, 16, 12),
                                margin: EdgeInsets.only(bottom: 28),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: TColors.neutralLightLight,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextHeading2(
                                      arguments.account.number,
                                      color: TColors.neutralDarkDarkest,
                                    ),
                                    SizedBox(
                                      height: 32,
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          padding: WidgetStatePropertyAll(
                                            EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 0,
                                            ),
                                          ),
                                        ),
                                        child: const TextActionL(
                                          "Salin",
                                          color: TColors.primary,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: TextBodyM(
                                  "Jumlah transfer",
                                  color: TColors.neutralDarkDark,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 12, 16, 12),
                                margin: EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: TColors.neutralLightLight,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          children: splittedAmount.map(
                                        (text) {
                                          bool isLastThreeDigits =
                                              text == splittedAmount.last;
                                          return TextSpan(
                                            text: text,
                                            style: GoogleFonts.inter(
                                                fontSize:
                                                    TSizes.fontSizeHeading2,
                                                color: isLastThreeDigits
                                                    ? TColors.error
                                                    : TColors
                                                        .neutralDarkDarkest,
                                                fontWeight: FontWeight.w900),
                                          );
                                        },
                                      ).toList()),
                                    ),
                                    SizedBox(
                                      height: 32,
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          padding: WidgetStatePropertyAll(
                                            EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 0,
                                            ),
                                          ),
                                        ),
                                        child: const TextActionL(
                                          "Salin",
                                          color: TColors.primary,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              TextBodyS(
                                "Pastikan jumlahnya benar hingga 3 digit terakhir",
                                color: TColors.neutralDarkLight,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: TextHeading3(
                      "Bukti transfer",
                      color: TColors.neutralDarkDarkest,
                    ),
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    color: TColors.primary,
                    dashPattern: const [4],
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 12),
                                child: UiIcons(
                                  TIcons.camera,
                                  height: 40,
                                  width: 40,
                                  color: TColors.primary,
                                ),
                              ),
                              TextBodyM(
                                "Foto bukti transfer",
                                color: TColors.primary,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(
                      context, "/payments/success_confirmation");
                },
                child: const TextActionL(
                  "Selesaikan",
                  color: TColors.neutralLightLightest,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
