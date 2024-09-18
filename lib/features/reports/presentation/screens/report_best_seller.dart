import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_cubit.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_master/report_master_state.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/list_tile/best_seller_product_tile.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ReportBestSellerScreen extends StatelessWidget {
  const ReportBestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportMasterCubit, ReportMasterState>(
      builder: (context, state) => switch (state) {
        ReportMasterLoadSuccess(:final report) => ReportBestSeller(
            bestSalesProduct: report.bestSalesProduct,
          ),
        _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
      },
    );
  }
}

class ReportBestSeller extends StatelessWidget {
  const ReportBestSeller({super.key, required this.bestSalesProduct});

  final List<OutletReportBestSalesProductModel> bestSalesProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Produk Terlaris",
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          backgroundColor: TColors.neutralLightLightest,
          onRefresh: () async {
            return await Future.delayed(const Duration(milliseconds: 200));
          },
          child: ListView.builder(
            itemCount: bestSalesProduct.length,
            itemBuilder: (context, index) {
              OutletReportBestSalesProductModel product =
                  bestSalesProduct.elementAt(index);

              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: TColors.neutralLightMedium,
                    ),
                  ),
                ),
                child: BestSellerProductTile(
                  imageSrc: product.images[0],
                  sold: product.soldCount,
                  name: product.name,
                  rank: index + 1,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/reports/best_seller/detail",
                      arguments: product,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
