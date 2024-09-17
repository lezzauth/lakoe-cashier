import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/customers/presentation/screens/customer_detail.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/cards/purchase_history_summary_card.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class ReportBestSellerDetailScreen extends StatelessWidget {
  const ReportBestSellerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => switch (state) {
        AuthReady() => const ReportBestSellerDetail(),
        _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
      },
    );
  }
}

class ReportBestSellerDetail extends StatefulWidget {
  const ReportBestSellerDetail({super.key});

  @override
  State<ReportBestSellerDetail> createState() => _ReportBestSellerDetailState();
}

class _ReportBestSellerDetailState extends State<ReportBestSellerDetail> {
  Widget _buildRank(int rank) {
    String icon = "";

    switch (rank) {
      case 1:
        icon = "🔥";
        break;
      case 2:
        icon = "👏";
        break;
      case 3:
        icon = "👍";
        break;
      default:
    }

    if (rank <= 3) {
      return Text(
        "$icon #$rank",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w900,
          color: TColors.neutralDarkMedium,
        ),
      );
    }

    return TextHeading5("#$rank");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Laporan Penjualan Produk",
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          backgroundColor: TColors.neutralLightLightest,
          onRefresh: () async {
            return await Future.delayed(const Duration(milliseconds: 200));
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 12,
                    bottom: 20,
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 4,
                        color: TColors.neutralLightMedium,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              margin: const EdgeInsets.only(right: 12),
                              child: Image.network(
                                "https://picsum.photos/100",
                                height: 44,
                                width: 44,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextHeading4(
                                    "Es Teh",
                                    color: TColors.neutralDarkDarkest,
                                  ),
                                  TextBodyM(
                                    TFormatter.formatToRupiah(5000),
                                    color: TColors.neutralDarkLight,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildRank(1)
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6, bottom: 8),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextHeading3(
                              "Riwayat Pembelian",
                              color: TColors.neutralDarkDarkest,
                            ),
                            TextBodyS(
                              "Terjual 89 item",
                              color: TColors.neutralDarkLight,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: PurchaseHistorySummaryCard(
                                title: "Total Keuntungan",
                                value: TFormatter.formatToRupiah(125000),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: PurchaseHistorySummaryCard(
                                title: "Pembeli Favorit",
                                value: "Nasruddin",
                                onTap: () {
                                  //
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              InputChip(
                                onPressed: () {
                                  //
                                },
                                label: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextBodyM("Semua Tanggal"),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, "/orders/detail",
                      //     arguments: OrderDetailArgument(id: order.id));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
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
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 8.0),
                                  child: RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.inter(
                                        fontSize: TSizes.fontSizeHeading4,
                                        color: TColors.neutralDarkDarkest,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      text: "Nasruddin",
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
                                  TFormatter.orderDate(
                                    DateTime.now().toIso8601String(),
                                  ),
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
                                  child: TransactionTypeTag(
                                    tag: "CASH",
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
                                            int.parse(
                                              "20000",
                                            ),
                                          ),
                                          style: GoogleFonts.inter(
                                            fontSize: TSizes.fontSizeBodyM,
                                            fontWeight: FontWeight.w800,
                                            color: TColors.neutralDarkDarkest,
                                          ),
                                        )
                                      ]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
