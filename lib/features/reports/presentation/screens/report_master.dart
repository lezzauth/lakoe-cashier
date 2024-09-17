import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/filters/date-filter/date_preset_range_filter.dart';
import 'package:point_of_sales_cashier/common/widgets/filters/date-filter/date_stepper_filter.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/cards/product_transaction_report_card.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/cards/report_card.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/cards/sales_total_card.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/list_tile/best_seller_product_tile.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DatePresetRangeFilter(
                    onChanged: ({duration, from, preset, template, to}) {
                      //
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    height: 44,
                    child: DateStepperFilter(
                      onChanged: ({from, template, to}) {
                        //
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const SalesTotalCard(),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ReportCard(
                          icon: const UiIcons(
                            TIcons.pieChartOutline,
                            height: 20,
                            width: 20,
                            color: TColors.primary,
                          ),
                          label: "Rata2 Nilai Transaksi",
                          amount: TFormatter.formatToRupiah(15000),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ReportCard(
                          icon: const UiIcons(
                            TIcons.billCheckedOutline,
                            height: 20,
                            width: 20,
                            color: TColors.primary,
                          ),
                          label: "Total Keuntungan",
                          amount: TFormatter.formatToRupiah(200000),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const ProductTransactionReportCard(),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
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
                          Navigator.pushNamed(context, "/reports/best_seller");
                        },
                        child: const TextHeading4(
                          "Lihat semua",
                          color: TColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                BestSellerProductTile(
                  imageSrc: "https://picsum.photos/44",
                  sold: 89,
                  name: "Es Teh",
                  rank: 1,
                  onTap: () {
                    //
                  },
                ),
                BestSellerProductTile(
                  imageSrc: "https://picsum.photos/45",
                  sold: 52,
                  name: "Mie Instan Goreng",
                  rank: 2,
                  onTap: () {
                    //
                  },
                ),
                BestSellerProductTile(
                  imageSrc: "https://picsum.photos/46",
                  sold: 31,
                  name: "Kopi Hitam",
                  rank: 3,
                  onTap: () {
                    //
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
