import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/filters/date-filter/date_preset_range_filter.dart';
import 'package:lakoe_pos/common/widgets/filters/date-filter/date_stepper_filter.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_1.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_master/report_master_cubit.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_master/report_master_filter_cubit.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_master/report_master_filter_state.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_master/report_master_state.dart';
import 'package:lakoe_pos/features/reports/data/arguments.dart';
import 'package:lakoe_pos/features/reports/presentation/widgets/cards/product_transaction_report_card.dart';
import 'package:lakoe_pos/features/reports/presentation/widgets/cards/report_card.dart';
import 'package:lakoe_pos/features/reports/presentation/widgets/cards/sales_total_card.dart';
import 'package:lakoe_pos/features/reports/presentation/widgets/list_tile/best_seller_product_tile.dart';
import 'package:lakoe_pos/features/reports/presentation/widgets/shimmer/report_master_shimmer.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class ReportMasterScreen extends StatelessWidget {
  const ReportMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReportMaster();
  }
}

class ReportMaster extends StatefulWidget {
  const ReportMaster({super.key});

  @override
  State<ReportMaster> createState() => _ReportMasterState();
}

class _ReportMasterState extends State<ReportMaster> {
  @override
  void initState() {
    super.initState();
    _onInit();
  }

  void _onInit() {
    context.read<ReportMasterCubit>().init();
  }

  Future<void> _onRefresh() async {
    if (!mounted) return;

    ReportMasterFilterState filterState =
        context.read<ReportMasterFilterCubit>().state;

    await context
        .read<ReportMasterCubit>()
        .findAll(dto: filterState.toGetOutletReportDto);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportMasterFilterCubit, ReportMasterFilterState>(
      listener: (context, state) {
        context.read<ReportMasterCubit>().findAll(
              dto: GetOutletReportDto(
                from: state.from,
                to: state.to,
                template: state.template,
              ),
            );
      },
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Laporan Penjualan",
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            backgroundColor: TColors.neutralLightLight,
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: BlocBuilder<ReportMasterCubit, ReportMasterState>(
                  builder: (context, state) => switch (state) {
                    ReportMasterLoadSuccess(:final report) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BlocBuilder<ReportMasterFilterCubit,
                                  ReportMasterFilterState>(
                              builder: (context, state) {
                            return DatePresetRangeFilter(
                              onChanged: ({
                                duration,
                                from,
                                preset,
                                template,
                                to,
                              }) {
                                context
                                    .read<ReportMasterFilterCubit>()
                                    .setFilter(
                                      duration: duration,
                                      from: from,
                                      preset: preset,
                                      template: template,
                                      to: to,
                                    );
                              },
                              duration: state.duration,
                              from: state.from,
                              preset: state.preset,
                              template: state.template,
                              to: state.to,
                            );
                          }),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: SizedBox(
                              height: 44,
                              child: BlocBuilder<ReportMasterFilterCubit,
                                      ReportMasterFilterState>(
                                  builder: (context, state) {
                                return DateStepperFilter(
                                  onChanged: ({from, template, to}) {
                                    context
                                        .read<ReportMasterFilterCubit>()
                                        .setFilter(
                                          from: from,
                                          template: template,
                                          to: to,
                                          preset: template,
                                        );
                                  },
                                  duration: state.duration,
                                  from: state.from,
                                  preset: state.preset,
                                  template: state.template,
                                  to: state.to,
                                );
                              }),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: BlocBuilder<ReportMasterFilterCubit,
                                ReportMasterFilterState>(
                              builder: (context, filterState) {
                                return SalesTotalCard(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      useSafeArea: true,
                                      builder: (context) {
                                        return DetailAmount(
                                          label: "Total Penjualan",
                                          amount: report.totalSales,
                                          description:
                                              "Total penjualan adalah akumulasi pendapatan dari semua pesanan yang sudah dibayar (paid) dalam periode tertentu. Pesanan yang belum dibayar tidak termasuk dalam total ini.",
                                        );
                                      },
                                    );
                                  },
                                  preset: filterState.preset,
                                  totalSales: report.totalSales,
                                  totalPastSales: report.totalPastSales,
                                  duration: filterState.duration,
                                  totalSalesDiff: report.totalSalesDiffComputed,
                                );
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ReportCard(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        useSafeArea: true,
                                        builder: (context) {
                                          return DetailAmount(
                                            label: "Rata-rata transaksi",
                                            amount: report.averageSales,
                                            description:
                                                "Rata-rata transaksi adalah nilai rata-rata dari total penjualan dibagi jumlah transaksi yang terjadi. Rumusnya: Total Penjualan ÷ Jumlah Transaksi.",
                                          );
                                        },
                                      );
                                    },
                                    icon: const UiIcons(
                                      TIcons.pieChartOutline,
                                      size: 20,
                                      color: TColors.primary,
                                    ),
                                    label: "Rata2 Transaksi",
                                    amount: TFormatter.formatToRupiah(
                                      report.averageSales == "NaN"
                                          ? 0
                                          : double.parse(
                                              report.averageSales,
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ReportCard(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        useSafeArea: true,
                                        builder: (context) {
                                          return DetailAmount(
                                            label:
                                                "Total Keuntungan (Penjualan)",
                                            amount: report.totalProfit,
                                            description:
                                                "Keuntungan penjualan adalah selisih antara harga jual dan harga modal produk. Rumusnya: Harga Jual - Harga Modal.",
                                          );
                                        },
                                      );
                                    },
                                    icon: const UiIcons(
                                      TIcons.billCheckedOutline,
                                      size: 20,
                                      color: TColors.primary,
                                    ),
                                    label: "Total Keuntungan",
                                    amount: TFormatter.formatToRupiah(
                                      double.parse(
                                        report.totalProfit,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ProductTransactionReportCard(
                              totalProductSold: report.totalProductSold,
                              totalTransaction: report.totalTransaction,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 16, left: 20, right: 20),
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextHeading3(
                                  "Produk Terlaris",
                                  color: TColors.neutralDarkDarkest,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/reports/best_seller");
                                  },
                                  child: const TextHeading4(
                                    "Lihat semua",
                                    color: TColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (report.bestSalesProduct.isNotEmpty)
                            ...report.bestSalesProduct.take(3).map(
                              (product) {
                                int index =
                                    report.bestSalesProduct.indexOf(product);

                                String? image =
                                    product.images.elementAtOrNull(0);

                                return BestSellerProductTile(
                                  imageUrl: image,
                                  sold: product.soldCount,
                                  name: product.name,
                                  rank: index + 1,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      "/reports/best_seller/detail",
                                      arguments: ReportProductSalesArguments(
                                        rank: index + 1,
                                        product: product,
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          else
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 20,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: SvgPicture.asset(
                                      TImages.productEmpty,
                                      height: 101.45,
                                      width: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: const TextHeading3(
                                      "Belum ada yang laku, nih!",
                                      color: TColors.neutralDarkDarkest,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 265,
                                    child: TextBodyS(
                                      "Kamu saat ini belum memiliki penjualan produk apapun",
                                      color: TColors.neutralDarkLight,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ReportMasterLoadFailure(:final error) =>
                      RepostMasterShimmer(errorText: error),
                    _ => RepostMasterShimmer(),
                  },
                )),
          ),
        ),
      ),
    );
  }
}

class DetailAmount extends StatelessWidget {
  final String label;
  final String amount;
  final String? description;

  const DetailAmount({
    super.key,
    required this.label,
    required this.amount,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBottomsheet(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 16,
                  bottom: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBodyL(
                      label,
                      color: TColors.neutralDarkLight,
                    ),
                    SizedBox(height: 4),
                    TextHeading1(
                      TFormatter.formatToRupiah(
                        amount == "NaN" ? 0 : double.parse(amount).round(),
                      ),
                    ),
                    if (description != null)
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextBodyS(
                              "————",
                              color: TColors.neutralLightDark,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            TextBodyM(
                              description ?? "",
                              color: TColors.neutralDarkDark,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: TextActionL("Oke! Paham"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
