import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_filter_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_filter_state.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/summary/stats_badge.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';

class OrderSummaryReport extends StatelessWidget {
  const OrderSummaryReport({super.key, required this.totalTransactions});

  final OutletReportTotalTransactionModel totalTransactions;

  StatsType getType() {
    if (totalTransactions.diffComputed == 0) return StatsType.neutral;
    if (totalTransactions.diffComputed.isNegative) return StatsType.descend;
    if (totalTransactions.diffComputed > 0) return StatsType.ascend;

    return StatsType.neutral;
  }

  String getComparisonText(CashierReportFilterState filter) {
    if (filter.preset == "TODAY") return "Kemarin";
    if (filter.preset == "THISWEEK") return "Minggu sebelumnya";
    if (filter.preset == "THISMONTH") return "Bulan sebelumnya";
    if (filter.duration != null) return "${filter.duration} hari sebelumnya";

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.neutralLightLight,
        borderRadius: BorderRadius.circular(16.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              TImages.receiptSlip,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Transaksi",
                          style: GoogleFonts.inter(
                            color: TColors.neutralDarkDarkest,
                            fontSize: TSizes.fontSizeHeading3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      BlocBuilder<CashierReportFilterCubit,
                          CashierReportFilterState>(
                        builder: (context, state) {
                          return Wrap(
                            direction: Axis.horizontal,
                            spacing: 8.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              StatsBadge(
                                type: getType(),
                                value: (totalTransactions.past == 0 &&
                                        totalTransactions.current > 0)
                                    ? "100%"
                                    : "${totalTransactions.diffComputed.abs()}%",
                              ),
                              Text(
                                "vs ${getComparisonText(state)}",
                                style: GoogleFonts.inter(
                                  color: TColors.neutralDarkLightest,
                                  fontSize: TSizes.fontSizeBodyM,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  "${totalTransactions.current}",
                  style: GoogleFonts.inter(
                    color: TColors.infoMedium,
                    fontSize: TSizes.fontSizeHeading1,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderSummaryFailed extends StatelessWidget {
  const OrderSummaryFailed({super.key, required this.onRefresh});

  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: TColors.neutralLightLight,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              TImages.receiptSlip,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Transaksi",
                          style: GoogleFonts.inter(
                            color: TColors.neutralDarkDarkest,
                            fontSize: TSizes.fontSizeHeading3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      BlocBuilder<CashierReportFilterCubit,
                          CashierReportFilterState>(
                        builder: (context, state) {
                          return Wrap(
                            direction: Axis.horizontal,
                            spacing: 8.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              StatsBadge(
                                type: StatsType.neutral,
                                value: "0%",
                              ),
                              Text(
                                "vs Kemarin",
                                style: GoogleFonts.inter(
                                  color: TColors.neutralDarkLightest,
                                  fontSize: TSizes.fontSizeBodyM,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: TColors.neutralDarkLightest,
                      highlightColor: TColors.neutralLightDarkest,
                      child: Text(
                        "Rp0",
                        style: GoogleFonts.inter(
                          color: TColors.infoMedium,
                          fontSize: TSizes.fontSizeHeading1,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: onRefresh,
                      child: const TextActionL(
                        "Klik untuk refresh",
                        color: TColors.primary,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
