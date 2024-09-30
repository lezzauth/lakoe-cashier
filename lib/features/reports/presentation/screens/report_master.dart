import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/filters/date-filter/date_preset_range_filter.dart';
import 'package:point_of_sales_cashier/common/widgets/filters/date-filter/date_stepper_filter.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_cubit.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_filter_state.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_state.dart';
import 'package:point_of_sales_cashier/features/reports/data/arguments.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/cards/product_transaction_report_card.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/cards/report_card.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/cards/sales_total_card.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/list_tile/best_seller_product_tile.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class ReportMasterScreen extends StatelessWidget {
  const ReportMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportMasterFilterCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
          AuthReady() => const ReportMaster(),
          _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
        },
      ),
    );
  }
}

class ReportMaster extends StatefulWidget {
  const ReportMaster({super.key});

  @override
  State<ReportMaster> createState() => _ReportMasterState();
}

class _ReportMasterState extends State<ReportMaster> {
  void _onInit() {
    context.read<ReportMasterCubit>().init();
  }

  @override
  void initState() {
    super.initState();
    _onInit();
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
        appBar: const CustomAppbar(
          title: "Laporan Penjualan",
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            backgroundColor: TColors.neutralLightLight,
            onRefresh: () async {
              return await Future.delayed(const Duration(milliseconds: 200));
            },
            child: SingleChildScrollView(
                child: BlocBuilder<ReportMasterCubit, ReportMasterState>(
              builder: (context, state) => switch (state) {
                ReportMasterLoadSuccess(:final report) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BlocBuilder<ReportMasterFilterCubit,
                          ReportMasterFilterState>(builder: (context, state) {
                        return DatePresetRangeFilter(
                          onChanged: ({
                            duration,
                            from,
                            preset,
                            template,
                            to,
                          }) {
                            context.read<ReportMasterFilterCubit>().setFilter(
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
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                                    );
                                  },
                                );
                              },
                              preset: filterState.preset,
                              totalSales: report.totalSales,
                              duration: filterState.duration,
                              totalSalesDiff: report.totalSalesDiff,
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
                                      );
                                    },
                                  );
                                },
                                icon: const UiIcons(
                                  TIcons.pieChartOutline,
                                  height: 20,
                                  width: 20,
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
                                        label: "Total Keuntungan Transaksi",
                                        amount: report.totalProfit,
                                      );
                                    },
                                  );
                                },
                                icon: const UiIcons(
                                  TIcons.billCheckedOutline,
                                  height: 20,
                                  width: 20,
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
                        padding:
                            const EdgeInsets.only(top: 16, left: 20, right: 20),
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

                            return BestSellerProductTile(
                              imageSrc: product.images[0],
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
                ReportMasterLoadFailure(:final error) => Center(
                    child: TextBodyS(
                      error,
                      color: TColors.error,
                    ),
                  ),
                _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
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
  const DetailAmount({super.key, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return CustomBottomsheet(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(
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
                    const SizedBox(height: 4),
                    TextHeading1(
                      TFormatter.formatToRupiah(
                        amount == "NaN"
                            ? 0
                            : int.parse(
                                amount,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const TextActionL("Oke, Tutup"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
