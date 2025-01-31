import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/shimmer/order_item_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_product_sales/report_product_sales_cubit.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_cubit.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_filter_cubit.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_filter_state.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_product_sales/report_product_sales_pagination_state.dart';
import 'package:lakoe_pos/features/reports/application/cubit/report_product_sales/report_product_sales_state.dart';
import 'package:lakoe_pos/features/reports/data/arguments.dart';
import 'package:lakoe_pos/features/reports/presentation/widgets/filter_orders.dart';
import 'package:lakoe_pos/features/reports/presentation/widgets/product_order_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
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
      child: ReportProductSales(arguments: arguments),
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

  bool isFilterUsed = false;
  bool _updateProduct = false;

  Future<void> _onGoToEditScreen(ProductModel product) async {
    bool? updateProduct = await Navigator.pushNamed(
      context,
      "/products/edit",
      arguments: product,
    ) as bool?;

    if (updateProduct != true) return;
    context.read<ReportProductSalesCubit>().findOne(product.id);

    setState(() {
      _updateProduct = updateProduct ?? false;
    });
  }

  Widget _buildRank(int rank, ProductModel product) {
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

    if (rank == 0) {
      return TextButton(
        onPressed: () => _onGoToEditScreen(product),
        child: TextActionL(
          "Ubah",
          color: TColors.primary,
        ),
      );
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

  void _onInit() {
    context
        .read<ReportProductSalesCubit>()
        .findOne(widget.arguments.product.id);
    context
        .read<ReportProductSalesPaginationCubit>()
        .fetchData(productId: widget.arguments.product.id);
  }

  Future<void> _onRefresh() async {
    if (!mounted) return;

    ReportProductSalesPaginationFilterState filterState =
        context.read<ReportProductSalesPaginationFilterCubit>().state;

    context.read<ReportProductSalesPaginationCubit>().reset();
    context.read<ReportProductSalesPaginationCubit>().fetchData(
          productId: widget.arguments.product.id,
          dto: filterState.toListOrderByProductDto,
        );
  }

  void _handleFilterChange(ListOrderByProductDto value) {
    final isAllNull = (value.template == null || value.template == "ALL") &&
        value.from == null &&
        value.to == null &&
        (value.status == null || value.status == "ALL");

    setState(() {
      isFilterUsed = !isAllNull;
    });

    final from = value.template == "CUSTOM"
        ? DateTime.parse(value.from!)
        : value.from != null
            ? DateTime.parse(value.from!)
            : null;

    final to = value.template == "CUSTOM"
        ? DateTime.parse(value.to!)
        : value.to != null
            ? DateTime.parse(value.to!)
            : null;

    context.read<ReportProductSalesPaginationFilterCubit>().setFilter(
          status: value.status,
          template: value.template,
          from: from,
          to: to,
        );
  }

  void _handleClearFilter() {
    setState(() {
      isFilterUsed = false;
    });
    context.read<ReportProductSalesPaginationFilterCubit>().clearFilter();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ReportProductSalesPaginationFilterCubit,
            ReportProductSalesPaginationFilterState>(
          listener: (context, state) {
            ReportProductSalesPaginationFilterState filterState =
                context.read<ReportProductSalesPaginationFilterCubit>().state;

            context.read<ReportProductSalesPaginationCubit>().reset();
            context.read<ReportProductSalesPaginationCubit>().fetchData(
                  productId: widget.arguments.product.id,
                  dto: filterState.toListOrderByProductDto,
                );
          },
        ),
        BlocListener<ReportProductSalesCubit, ReportProductSalesState>(
          listener: (context, state) {},
        )
      ],
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Laporan Penjualan Produk",
          handleBackButton: () => Navigator.pop(context, _updateProduct),
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            backgroundColor: TColors.neutralLightLightest,
            onRefresh: _onRefresh,
            child:
                BlocBuilder<ReportProductSalesCubit, ReportProductSalesState>(
              builder: (context, state) {
                if (state is ReportProductSalesLoadSuccess) {
                  final product = state.product;
                  return CustomScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: _scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: (widget.arguments.rank == 0) ? 12 : 20,
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
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: product.images.isNotEmpty
                                            ? Image.network(
                                                product.images[0],
                                                height: 44,
                                                width: 44,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return SvgPicture.asset(
                                                    TImages.productAvatar,
                                                    height: 44,
                                                    width: 44,
                                                    fit: BoxFit.cover,
                                                  );
                                                },
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return SvgPicture.asset(
                                                    TImages.productAvatar,
                                                    fit: BoxFit.cover,
                                                  );
                                                },
                                              )
                                            : SvgPicture.asset(
                                                TImages.productAvatar,
                                                height: 44,
                                                width: 44,
                                                fit: BoxFit.cover,
                                              ),
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
                                              double.parse(product.price),
                                            ),
                                            color: TColors.neutralDarkLight,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              _buildRank(widget.arguments.rank, product),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 6, bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextHeading3(
                                            "Riwayat Penjualan",
                                            color: TColors.neutralDarkDarkest,
                                          ),
                                          // if (widget.arguments.product
                                          //         .soldCount !=
                                          //     0)
                                          //   TextBodyM(
                                          //     "Terjual ${widget.arguments.product.soldCount} produk",
                                          //     color:
                                          //         TColors.neutralDarkLightest,
                                          //   ),
                                        ],
                                      ),
                                    ),
                                    // Container(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       vertical: 8),
                                    //   child: Column(
                                    //     children: [
                                    //       IntrinsicHeight(
                                    //         child: Row(
                                    //           children: [
                                    //             Expanded(
                                    //               child:
                                    //                   PurchaseHistorySummaryCard(
                                    //                 strongCard: true,
                                    //                 title: "Total Keuntungan",
                                    //                 value: TFormatter
                                    //                     .formatToRupiah(
                                    //                   double.parse("1000000"),
                                    //                 ),
                                    //                 onTap: () {},
                                    //               ),
                                    //             ),
                                    //             const SizedBox(width: 12),
                                    //             Container(
                                    //               width: 120,
                                    //               alignment:
                                    //                   Alignment.centerLeft,
                                    //               decoration: BoxDecoration(
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(
                                    //                         12),
                                    //                 color: TColors
                                    //                     .neutralLightLight,
                                    //                 border: Border.all(
                                    //                   width: 1,
                                    //                   color: TColors
                                    //                       .neutralLightMedium,
                                    //                 ),
                                    //               ),
                                    //               padding: const EdgeInsets
                                    //                   .symmetric(
                                    //                 horizontal: 16,
                                    //                 vertical: 12,
                                    //               ),
                                    //               child: Column(
                                    //                 mainAxisSize:
                                    //                     MainAxisSize.min,
                                    //                 crossAxisAlignment:
                                    //                     CrossAxisAlignment
                                    //                         .start,
                                    //                 children: [
                                    //                   TextHeading5(
                                    //                     "Terjual",
                                    //                     color: TColors
                                    //                         .neutralDarkLightest,
                                    //                   ),
                                    //                   const SizedBox(height: 8),
                                    //                   TextHeading3(
                                    //                     "${widget.arguments.product.soldCount} produk",
                                    //                     color: TColors
                                    //                         .neutralDarkDarkest,
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ),
                                    //       const SizedBox(height: 12),
                                    //       Row(
                                    //         children: [
                                    //           Expanded(
                                    //             child:
                                    //                 PurchaseHistorySummaryCard(
                                    //               title: "Total Penjualan",
                                    //               value:
                                    //                   TFormatter.formatToRupiah(
                                    //                 double.parse(
                                    //                     product.profit),
                                    //               ),
                                    //               onTap: () {},
                                    //             ),
                                    //           ),
                                    //           const SizedBox(width: 12),
                                    //           Expanded(
                                    //             child:
                                    //                 PurchaseHistorySummaryCard(
                                    //               title: "Total Terhutang",
                                    //               value:
                                    //                   TFormatter.formatToRupiah(
                                    //                 double.parse("10000"),
                                    //               ),
                                    //               onTap: () {},
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              BlocBuilder<
                                  ReportProductSalesPaginationFilterCubit,
                                  ReportProductSalesPaginationFilterState>(
                                builder: (context, state) {
                                  return FilterOrdersByProduct(
                                    value: state.toListOrderByProductDto,
                                    onClear: () {
                                      _handleClearFilter();
                                    },
                                    onChanged: (value) {
                                      _handleFilterChange(value);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<ReportProductSalesPaginationCubit,
                          ReportProductSalesPaginationState>(
                        builder: (context, state) {
                          if (state
                              is ReportProductSalesPaginationLoadSuccess) {
                            if (state.data.isEmpty) {
                              return SliverToBoxAdapter(
                                child: EmptyList(
                                  image: SvgPicture.asset(
                                    TImages.catBox,
                                    width: 140,
                                    height: 101.45,
                                  ),
                                  title: (!isFilterUsed)
                                      ? "${product.name} belum pernah terjual"
                                      : "Penjualan tidak ditemukan",
                                  subTitle: (!isFilterUsed)
                                      ? "Yuk, promosikan lagi produk ini. Siapa tahu, pelanggan kamu belum tahu."
                                      : "Ubah tanggal atau ganti filter status untuk melihat penjualan ${product.name}",
                                  action: (!isFilterUsed)
                                      ? SizedBox.shrink()
                                      : TextButton(
                                          onPressed: _handleClearFilter,
                                          child: TextActionL(
                                            "Hapus Filter",
                                            color: TColors.primary,
                                          ),
                                        ),
                                ),
                              );
                            } else {
                              return SliverList.builder(
                                itemCount: state.data.length,
                                itemBuilder: (context, index) {
                                  ProductOrderModel order =
                                      state.data.elementAt(index);

                                  return ProductOrderItem(order: order);
                                },
                              );
                            }
                          } else if (state
                              is ReportProductSalesPaginationLoadFailure) {
                            return SliverToBoxAdapter(
                              child: EmptyList(
                                title: "Gagal memuat data, nih!",
                                subTitle:
                                    "Ada sedikit gangguan. Coba coba lagi, ya",
                                action: TextButton(
                                  onPressed: _onRefresh,
                                  child: TextActionL(
                                    "Coba Lagi",
                                    color: TColors.primary,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SliverToBoxAdapter(
                              child: OrderItemListShimmer(hasAvatar: false),
                            );
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
