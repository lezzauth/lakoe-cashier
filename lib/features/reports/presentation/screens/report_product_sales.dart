import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/filters/date-filter/date_range_filter_chip.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_product_sales/report_product_sales_cubit.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_cubit.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_filter_state.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_state.dart';
import 'package:point_of_sales_cashier/features/reports/application/cubit/report_product_sales/report_product_sales_state.dart';
import 'package:point_of_sales_cashier/features/reports/data/arguments.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/cards/purchase_history_summary_card.dart';
import 'package:point_of_sales_cashier/features/reports/presentation/widgets/product_order_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:product_repository/product_repository.dart';

class ReportProductSalesScreen extends StatelessWidget {
  const ReportProductSalesScreen({super.key, required this.arguments});

  final ReportProductSalesArguments arguments;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ReportProductSalesCubit()),
        BlocProvider(create: (context) => ReportProductSalesPaginationCubit()),
        BlocProvider(
            create: (context) => ReportProductSalesPaginationFilterCubit()),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) => switch (state) {
          AuthReady() => ReportProductSales(arguments: arguments),
          _ => const Scaffold(body: Center(child: CircularProgressIndicator())),
        },
      ),
    );
  }
}

class ReportProductSales extends StatefulWidget {
  const ReportProductSales({super.key, required this.arguments});

  final ReportProductSalesArguments arguments;

  @override
  State<ReportProductSales> createState() => _ReportProductSalesState();
}

class _ReportProductSalesState extends State<ReportProductSales> {
  final ScrollController _scrollController = ScrollController();

  Widget _buildRank(int rank) {
    String icon = "";

    switch (rank) {
      case 1:
        icon = "🔥";
        break;
      case 2:
        icon = "👏";
        break;
      case 3:
        icon = "👍";
        break;
      default:
    }

    if (rank <= 3) {
      return Text(
        "$icon #$rank",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w900,
          color: TColors.neutralDarkMedium,
        ),
      );
    }

    return TextHeading5("#$rank");
  }

  void _onInit() {
    context
        .read<ReportProductSalesCubit>()
        .findOne(widget.arguments.product.id);
    context
        .read<ReportProductSalesPaginationCubit>()
        .fetchData(productId: widget.arguments.product.id);
  }

  @override
  void initState() {
    super.initState();
    _onInit();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<ReportProductSalesPaginationCubit>().loadMoreItems();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportProductSalesPaginationFilterCubit,
        ReportProductSalesPaginationFilterState>(
      listener: (context, state) {
        context.read<ReportProductSalesPaginationCubit>().reset();

        context.read<ReportProductSalesPaginationCubit>().fetchData(
              productId: widget.arguments.product.id,
              dto: ListOrderByProductDto(from: state.from, to: state.to),
            );
      },
      child: Scaffold(
        appBar: const CustomAppbar(
          title: "Laporan Penjualan Produk",
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            backgroundColor: TColors.neutralLightLightest,
            onRefresh: () async {
              return await Future.delayed(const Duration(milliseconds: 200));
            },
            child:
                BlocBuilder<ReportProductSalesCubit, ReportProductSalesState>(
              builder: (context, state) => switch (state) {
                ReportProductSalesLoadSuccess(:final product) =>
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 12,
                            bottom: 20,
                          ),
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 4,
                                color: TColors.neutralLightMedium,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      margin: const EdgeInsets.only(right: 12),
                                      child: Image.network(
                                        "https://picsum.photos/100",
                                        height: 44,
                                        width: 44,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextHeading4(
                                            product.name,
                                            color: TColors.neutralDarkDarkest,
                                          ),
                                          TextBodyM(
                                            TFormatter.formatToRupiah(
                                              int.parse(
                                                product.price,
                                              ),
                                            ),
                                            color: TColors.neutralDarkLight,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _buildRank(widget.arguments.rank)
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 6, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TextHeading3(
                                      "Riwayat Pembelian",
                                      color: TColors.neutralDarkDarkest,
                                    ),
                                    TextBodyS(
                                      "Terjual ${widget.arguments.product.soldCount} item",
                                      color: TColors.neutralDarkLight,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: PurchaseHistorySummaryCard(
                                        title: "Total Keuntungan",
                                        value: TFormatter.formatToRupiah(
                                          int.parse(product.profit),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: PurchaseHistorySummaryCard(
                                        title: "Pembeli Favorit",
                                        value:
                                            product.favoriteCustomerId == null
                                                ? "-"
                                                : "Umum",
                                        onTap: () {
                                          //
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: SingleChildScrollView(
                                  child: Row(
                                    children: [
                                      BlocBuilder<
                                          ReportProductSalesPaginationFilterCubit,
                                          ReportProductSalesPaginationFilterState>(
                                        builder: (context, filterState) {
                                          return DateRangeFilterChip(
                                            onChanged: (from, to) {
                                              context
                                                  .read<
                                                      ReportProductSalesPaginationFilterCubit>()
                                                  .setFilter(
                                                    from: from,
                                                    to: to,
                                                  );
                                            },
                                            from: filterState.from,
                                            to: filterState.to,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<ReportProductSalesPaginationCubit,
                          ReportProductSalesPaginationState>(
                        builder: (context, paginationState) =>
                            switch (paginationState) {
                          ReportProductSalesPaginationLoadSuccess() =>
                            SliverList.builder(
                              itemCount: paginationState.data.length,
                              itemBuilder: (context, index) {
                                ProductOrderModel order =
                                    paginationState.data.elementAt(index);

                                return ProductOrderItem(order: order);
                              },
                            ),
                          _ => const SliverToBoxAdapter(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                        },
                      )
                    ],
                  ),
                _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
              },
            ),
          ),
        ),
      ),
    );
  }
}