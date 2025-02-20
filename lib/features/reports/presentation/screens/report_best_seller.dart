import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lakoe_pos/common/widgets/filters/date-filter/date_preset_range_filter.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_master/report_master_filter_cubit.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_master/report_master_filter_state.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_master/report_master_cubit.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_master/report_master_state.dart';
import 'package:lakoe_pos/features/reports/data/arguments.dart';
import 'package:lakoe_pos/features/reports/presentation/widgets/list_tile/best_seller_product_tile.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

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
          child: bestSalesProduct.isNotEmpty
              ? Column(
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
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: bestSalesProduct.length,
                        itemBuilder: (context, index) {
                          OutletReportBestSalesProductModel product =
                              bestSalesProduct.elementAt(index);

                          String? image = product.images.elementAtOrNull(0);

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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : EmptyList(
                  image: SvgPicture.asset(
                    TImages.productEmpty,
                    height: 200,
                    width: 276,
                    fit: BoxFit.cover,
                  ),
                  title: "Belum ada yang laku, nih!",
                  subTitle:
                      "Kamu saat ini belum memiliki penjualan produk apapun",
                ),
        ),
      ),
    );
  }
}
