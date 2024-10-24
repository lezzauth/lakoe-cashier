import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_filter_state.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_state.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/appbar/dashboard_appbar.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/banner/dashboard_banner.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/filter/dashboard_day_select_filter.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/filter/dashboard_filter.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/item_menu/item_menu_container.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/main_menu/main_menu.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/summary/sales_summary.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/summary/transaction_summary.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uni_links/uni_links.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CashierReportCubit()),
        BlocProvider(create: (context) => CashierReportFilterCubit()),
      ],
      child: const Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  StreamSubscription? _sub;

  Future<void> _onInit() async {
    context.read<CashierCubit>().getOpenCashier();
    context.read<CashierReportCubit>().init();
  }

  @override
  void initState() {
    super.initState();
    _onInit();
    handleDeeplink();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  void handleDeeplink() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null &&
          uri.scheme == 'app.lakoe' &&
          uri.host == 'payment' &&
          uri.path == '/success') {
        Navigator.pushNamed(context, "/payment/success");
      } else {}
    }, onError: (err) {
      // Error handling
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CashierReportFilterCubit, CashierReportFilterState>(
      listener: (context, state) {
        context.read<CashierReportCubit>().getReport(
              dto: GetOutletSalesDto(
                from: state.from,
                template: state.template,
                to: state.to,
              ),
            );
      },
      child: Scaffold(
        appBar: const DashboardAppbar(),
        body: SafeArea(
          child: ListView(
            children: [
              const MainMenu(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const ItemMenuContainer(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                margin: const EdgeInsets.only(bottom: 12),
                child: const DashboardBanner(),
              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 24),
              //   margin: const EdgeInsets.only(bottom: 12),
              //   child: const AIBanner(),
              // ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: const DashboardFilter(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.only(bottom: 12),
                child: const DashboardDaySelectFilter(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                margin: const EdgeInsets.only(bottom: 12),
                child: BlocBuilder<CashierReportCubit, CashierReportState>(
                  builder: (context, state) => switch (state) {
                    CashierReportLoadSuccess(:final report) => Column(
                        children: [
                          SalesSummary(
                            totalSales: report.total_sales,
                          ),
                          const SizedBox(height: 12),
                          TransactionSummary(
                            totalTransactions: report.total_transactions,
                          ),
                        ],
                      ),
                    CashierReportLoadFailure(:final error) => Center(
                        child: TextBodyS(
                          error,
                          color: TColors.error,
                        ),
                      ),
                    _ => Shimmer.fromColors(
                        baseColor: const Color(0xFFE8E9F1),
                        highlightColor: const Color(0xFFF8F9FE),
                        child: Column(
                          children: [
                            Container(
                              height: 127,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: TColors.neutralLightLightest,
                                border: Border.all(
                                    color: TColors.neutralLightMedium,
                                    width: 1),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              height: 127,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: TColors.neutralLightLightest,
                                border: Border.all(
                                    color: TColors.neutralLightMedium,
                                    width: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
