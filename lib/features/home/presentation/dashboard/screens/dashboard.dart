import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/appbar/dashboard_appbar.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/banner/dashboard_banner.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/filter/dashboard_day_select_filter.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/filter/dashboard_filter.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/item_menu/item_menu_container.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/main_menu/main_menu.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/summary/income_summary.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/summary/sales_summary.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppbar(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: const MainMenu(
                cashierName: "Dimas Kurniawan",
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(bottom: 12),
              child: const ItemMenuContainer(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(bottom: 12),
              child: const DashboardBanner(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(bottom: 12),
              child: const DashboardFilter(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(bottom: 12),
              child: const DashboardDaySelectFilter(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(bottom: 12),
              child: Column(
                children: [
                  IncomeSummary(),
                  SizedBox(height: 12),
                  SalesSummary(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
