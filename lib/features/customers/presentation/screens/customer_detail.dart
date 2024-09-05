import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => switch (state) {
        AuthReady() => const CustomerDetail(),
        _ => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      },
    );
  }
}

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({super.key});

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Detail Pelanggan",
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(Duration(seconds: 1));
          },
          backgroundColor: TColors.neutralLightLightest,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            TImages.contactAvatar,
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(width: 16),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHeading4("Rangga"),
                              TextBodyS(
                                "0821-0987-6543",
                                color: TColors.neutralDarkLight,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            UiIcons(
                              TIcons.coinMultiple,
                              height: 16,
                              width: 16,
                              color: TColors.primary,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            TextHeading4("3.400"),
                          ],
                        ),
                        TextBodyS(
                          "Poin",
                          color: TColors.neutralDarkLight,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 4,
                color: TColors.neutralLightMedium,
                margin: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              ),
              Container(
                padding: const EdgeInsets.only(top: 6.0, left: 16, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextHeading3("Riwayat Transaksi"),
                          TextBodyS(
                            "Total 6 transaksi",
                            color: TColors.neutralDarkLight,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomerSummaryCard(
                              title: "Total Belanja",
                              value: TFormatter.formatToRupiah(125000),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomerSummaryCard(
                              title: "Menu Favorit",
                              value: "Es Teh",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.start,
                                spacing: 8,
                                children: [
                                  InputChip(
                                    onPressed: () {},
                                    label: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextBodyS("Urutkan"),
                                        SizedBox(width: 8),
                                        UiIcons(
                                          TIcons.arrowDown,
                                          height: 12,
                                          width: 12,
                                          color: TColors.neutralDarkLightest,
                                        ),
                                      ],
                                    ),
                                  ),
                                  InputChip(
                                    onPressed: () {},
                                    label: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextBodyS("Semua Tanggal"),
                                        SizedBox(width: 8),
                                        UiIcons(
                                          TIcons.arrowDown,
                                          height: 12,
                                          width: 12,
                                          color: TColors.neutralDarkLightest,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: TColors.neutralLightMedium,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 47,
                            bottom: 0,
                            child: Image.asset(
                              TImages.stamp,
                              width: 80,
                              height: 53.35,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.inter(
                                            fontSize: TSizes.fontSizeHeading4,
                                            color: TColors.neutralDarkDarkest,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          text: "Order #1534",
                                          children: [
                                            TextSpan(
                                              style: GoogleFonts.inter(
                                                fontSize: TSizes.fontSizeBodyS,
                                                color: TColors.neutralDarkLight,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              text: " - (3 Item)",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    TextBodyS(
                                      "04 Aug 2024 - 15:03",
                                      color: TColors.neutralDarkLight,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: const TransactionTypeTag(
                                        tag: "qris",
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "Total: ",
                                          style: GoogleFonts.inter(
                                            fontSize: TSizes.fontSizeBodyS,
                                            color: TColors.neutralDarkLight,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: TFormatter.formatToRupiah(
                                                10000 * (index + 1),
                                              ),
                                              style: GoogleFonts.inter(
                                                fontSize: TSizes.fontSizeBodyM,
                                                fontWeight: FontWeight.w800,
                                                color:
                                                    TColors.neutralDarkDarkest,
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionTypeTag extends StatelessWidget {
  const TransactionTypeTag({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    String getTagLabel() {
      switch (tag) {
        case "cash":
          return "Cash";
        case "qris":
          return "QRIS";
        case "debit":
          return "Debit";
        default:
          return "Cash";
      }
    }

    Color getTagBackgroundColor() {
      switch (tag) {
        case "cash":
          return TColors.successLight;
        case "qris":
          return TColors.infoLight;
        case "debit":
          return TColors.warningLight;
        default:
          return TColors.successLight;
      }
    }

    Color getTagTextColor() {
      switch (tag) {
        case "cash":
          return TColors.successMedium;
        case "qris":
          return TColors.infoMedium;
        case "debit":
          return TColors.warningDark;
        default:
          return TColors.successMedium;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: getTagBackgroundColor(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextHeading5(
        getTagLabel(),
        color: getTagTextColor(),
      ),
    );
  }
}

class CustomerSummaryCard extends StatelessWidget {
  const CustomerSummaryCard({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: TColors.neutralLightLight,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          width: 1,
          color: TColors.neutralLightMedium,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: TextHeading5(
              title,
              color: TColors.neutralDarkLightest,
            ),
          ),
          TextHeading3(
            value,
            color: TColors.neutralDarkDarkest,
          ),
        ],
      ),
    );
  }
}
