import 'dart:async';

import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/shimmer/shimmer_card_report.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_cubit.dart';
import 'package:lakoe_pos/utils/helpers/request_review.dart';
import 'package:logman/logman.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_filter_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_filter_state.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_state.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/appbar/dashboard_appbar.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/filter/dashboard_day_select_filter.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/filter/dashboard_filter.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/item_menu/item_menu_container.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/main_menu/access_cashier.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/main_menu/access_cashier_tablet.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/summary/sales_summary.dart';
import 'package:lakoe_pos/features/home/presentation/dashboard/widgets/summary/orders_summary.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

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
  DateTime? lastBackPressed;

  Future<void> _onInit() async {
    context.read<OwnerCubit>().getOwner();
    context.read<CashierCubit>().getOpenCashier();
    context.read<CashierReportCubit>().init();
    context.read<PackageMasterCubit>().init();

    _checkAndRequestReview();
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    context.read<CashierCubit>().getOpenCashier();
    context.read<CashierReportCubit>().init();
  }

  Future<void> _checkAndRequestReview() async {
    final appData = AppDataProvider();
    bool hasOrderedBefore = await appData.hasMadeFirstOrder;
    bool hasSeenReview = await appData.hasSeenReviewPrompt;

    Logman.instance.info("hasOrderedBefore: $hasOrderedBefore");

    if (hasOrderedBefore && !hasSeenReview) {
      Logman.instance
          .info("✅ Users are eligible for review, displaying a prompt...");
      if (!mounted) return;
      await RequestReview.request(context);
    } else {
      Logman.instance.info(
          "⏳ User has not met the requirements or has already viewed the review.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        final now = DateTime.now();
        if (lastBackPressed == null ||
            now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
          lastBackPressed = now;
          CustomToast.show(
            "Tekan sekali lagi untuk keluar",
            position: 'bottom',
            duration: 2,
          );
          return;
        } else {
          SystemNavigator.pop();
        }
      },
      child: BlocListener<CashierReportFilterCubit, CashierReportFilterState>(
        listener: (context, state) {
          context.read<CashierReportCubit>().getReport(
                dto: GetOutletSalesDto(
                  from: state.from,
                  template: state.template,
                  to: state.to,
                ),
              );
        },
        child: Scrollbar(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            backgroundColor: TColors.neutralLightLightest,
            child: Scaffold(
              appBar: DashboardAppbar(),
              body: SafeArea(
                child: ListView(
                  children: [
                    ResponsiveLayout(
                      mobile: AccessCashier(),
                      tablet: AccessCashierTablet(),
                    ),

                    ResponsiveLayout(
                      mobile: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        margin: EdgeInsets.only(bottom: 8),
                        child: ItemMenuContainer(),
                      ),
                      tablet: SizedBox.shrink(),
                    ),

                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 24),
                    //   margin: EdgeInsets.only(bottom: 12),
                    //   child: DashboardBanner(),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 24),
                    //   margin: EdgeInsets.only(bottom: 12),
                    //   child: AIBanner(),
                    // ),

                    Container(
                      height: 4,
                      color: TColors.neutralLightMedium,
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 12, top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TextHeading2(
                        "Laporan singkat kamu, nih!",
                        color: TColors.neutralDarkDark,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      child: DashboardFilter(),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.only(bottom: 12),
                      child: DashboardDaySelectFilter(),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      margin: EdgeInsets.only(bottom: 12),
                      child:
                          BlocBuilder<CashierReportCubit, CashierReportState>(
                        builder: (context, state) {
                          if (state is CashierReportLoadSuccess) {
                            final report = state.report;
                            return ResponsiveLayout(
                              tablet: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: SalesSummary(
                                      totalSales: report.total_sales,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: OrderSummaryReport(
                                      totalTransactions:
                                          report.total_transactions,
                                    ),
                                  ),
                                ],
                              ),
                              mobile: Column(
                                children: [
                                  SalesSummary(
                                    totalSales: report.total_sales,
                                  ),
                                  SizedBox(height: 16),
                                  OrderSummaryReport(
                                    totalTransactions:
                                        report.total_transactions,
                                  ),
                                ],
                              ),
                            );
                          } else if (state is CashierReportLoadFailure) {
                            // final error = state.error;
                            return ResponsiveLayout(
                              tablet: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: SalesSummaryFailed(
                                      onRefresh: () {
                                        context
                                            .read<CashierReportCubit>()
                                            .init();
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: OrderSummaryFailed(
                                      onRefresh: () {
                                        context
                                            .read<CashierReportCubit>()
                                            .init();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              mobile: Column(
                                children: [
                                  SalesSummaryFailed(
                                    onRefresh: () {
                                      context.read<CashierReportCubit>().init();
                                    },
                                  ),
                                  SizedBox(height: 16),
                                  OrderSummaryFailed(
                                    onRefresh: () {
                                      context.read<CashierReportCubit>().init();
                                    },
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return ShimmerCardReport();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
