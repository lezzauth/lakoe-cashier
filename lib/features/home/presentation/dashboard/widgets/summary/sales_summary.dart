import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_filter_state.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/summary/stats_badge.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class SalesSummary extends StatelessWidget {
  const SalesSummary({super.key, required this.totalSales});

  final OutletReportTotalSaleModel totalSales;

  StatsType getType() {
    if (totalSales.diff == null) return StatsType.neutral;
    if (totalSales.diff! == 0) return StatsType.neutral;
    if (totalSales.diff!.isNegative) return StatsType.descend;
    if (totalSales.diff! > 0) return StatsType.ascend;

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
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              TImages.tradingNews,
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
                          "Pendapatan",
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
                                value: "${totalSales.diff ?? 0}%",
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
                  TFormatter.formatToRupiah(int.parse(totalSales.current)),
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
