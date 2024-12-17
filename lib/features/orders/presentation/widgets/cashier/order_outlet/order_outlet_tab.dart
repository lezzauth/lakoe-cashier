import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/shimmer/order_item_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_filter_state.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/cashier/order_cashier_state.dart';
import 'package:lakoe_pos/features/orders/common/widgets/order_item/order_card_item.dart';
import 'package:lakoe_pos/features/orders/common/widgets/order_item/order_list_item.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_outlet/filter/order_outlet_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OrderCashierOutlet extends StatefulWidget {
  const OrderCashierOutlet({
    super.key,
    this.searchController,
    this.searchFocusNode,
  });

  final TextEditingController? searchController;
  final FocusNode? searchFocusNode;

  @override
  State<OrderCashierOutlet> createState() => _OrderCashierOutletState();
}

class _OrderCashierOutletState extends State<OrderCashierOutlet> {
  bool _isFilterUsed = false;
  String _keywordSearch = "";

  Future<void> onRefresh() async {
    OrderCashierFilterState filterState =
        context.read<OrderCashierFilterCubit>().state;

    final updatedFilterState = filterState.sort == null
        ? filterState.copyWith(sort: 'NEWEST')
        : filterState;

    await context
        .read<OrderCashierCubit>()
        .findAll(updatedFilterState.toFindAllOrderDto);
  }

  @override
  void initState() {
    super.initState();
    context.read<OrderCashierCubit>().init();
  }

  void _handleClearFilter() {
    if (_keywordSearch.isNotEmpty) {
      widget.searchFocusNode!.requestFocus();
      widget.searchController!.selection = TextSelection(
        baseOffset: 0,
        extentOffset: widget.searchController!.text.length,
      );
    } else {
      context.read<OrderCashierFilterCubit>().clearFilter();
      setState(() {
        _isFilterUsed = false;
      });
    }
  }

  String _determineTitle() {
    if (!_isFilterUsed && _keywordSearch.isEmpty) {
      return "Belum ada pesanan, nih!";
    } else if (_keywordSearch.isNotEmpty) {
      return "Pencarian tidak ditemukan";
    } else {
      return "Pesanan tidak ditemukan";
    }
  }

  String _determineSubTitle() {
    if (!_isFilterUsed && _keywordSearch.isEmpty) {
      return "Saat ini belum ada pesanan masuk. Yuk, bikin pesanan pertama untuk hari ini.";
    } else if (_keywordSearch.isNotEmpty) {
      return "Coba cari dengan no. order, no. meja atau nama pelanggan yang lain";
    } else {
      return "Ganti status atau hapus filter untuk melihat pesanan hari ini.";
    }
  }

  Widget _buildActionButton() {
    if (!_isFilterUsed && _keywordSearch.isEmpty) {
      return SizedBox.shrink();
    } else {
      return TextButton(
        onPressed: _handleClearFilter,
        child: TextActionL(
          _keywordSearch.isNotEmpty ? "Ubah Pencarian" : "Hapus Filter",
          color: TColors.primary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return MultiBlocListener(
      listeners: [
        BlocListener<OrderCashierFilterCubit, OrderCashierFilterState>(
          listener: (context, state) {
            context.read<OrderCashierCubit>().findAll(state.toFindAllOrderDto);

            setState(() {
              _keywordSearch = state.toFindAllOrderDto.search ?? "";
            });
          },
        ),
      ],
      child: Scaffold(
        backgroundColor:
            isMobile ? TColors.neutralLightLightest : TColors.neutralLightLight,
        body: Scrollbar(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            backgroundColor: TColors.neutralLightLightest,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BlocBuilder<OrderCashierFilterCubit,
                      OrderCashierFilterState>(
                    builder: (context, state) {
                      return OrderOutletFilter(
                        value: state.toFindAllOrderDto,
                        isFilterUsed: _isFilterUsed,
                        onChanged: (value) {
                          final cubit = context.read<OrderCashierFilterCubit>();

                          cubit.setFilter(
                            sort: value.sort,
                            source: value.source,
                            type: value.type,
                            status: value.status,
                          );

                          setState(() {
                            _isFilterUsed = cubit.hasFilterChanged();
                          });
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<OrderCashierCubit, OrderCashierState>(
                    builder: (context, state) {
                      if (state is OrderCashierLoadSuccess) {
                        final orders = state.orders;

                        return CustomScrollView(
                          slivers: [
                            if (orders.isNotEmpty) ...[
                              ResponsiveLayout(
                                mobile: SliverList.builder(
                                  itemCount: orders.length,
                                  itemBuilder: (context, index) {
                                    OrderCashierItemRes order =
                                        orders.elementAt(index);

                                    return OrderListItem(
                                      isCashier: true,
                                      order: order,
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          "/orders/detail",
                                          arguments: OrderDetailArgument(
                                            id: order.id,
                                            isCashier: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                tablet: SliverPadding(
                                  padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                                  sliver: SliverGrid.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 360,
                                      mainAxisExtent: 114,
                                      childAspectRatio: 360 / 114,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                    ),
                                    itemCount: orders.length,
                                    itemBuilder: (context, index) {
                                      OrderCashierItemRes order =
                                          orders.elementAt(index);

                                      return OrderCardItem(
                                        order: order,
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            "/orders/detail",
                                            arguments: OrderDetailArgument(
                                              id: order.id,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SliverToBoxAdapter(
                                child: SizedBox(height: 72),
                              ),
                            ],
                            if (orders.isEmpty)
                              SliverToBoxAdapter(
                                child: EmptyList(
                                  image: _keywordSearch.isNotEmpty
                                      ? null
                                      : SvgPicture.asset(
                                          TImages.catBox,
                                          width: 276,
                                          height: 200,
                                        ),
                                  title: _determineTitle(),
                                  subTitle: _determineSubTitle(),
                                  action: _buildActionButton(),
                                ),
                              ),
                          ],
                        );
                      } else if (state is OrderCashierLoadFailure) {
                        return EmptyList(
                          title: "Gagal memuat data, nih!",
                          subTitle: "Ada sedikit gangguan. Coba coba lagi, ya",
                          action: TextButton(
                            onPressed: onRefresh,
                            child: TextActionL(
                              "Coba Lagi",
                              color: TColors.primary,
                            ),
                          ),
                        );
                      } else {
                        return ResponsiveLayout(
                          mobile: OrderItemListShimmer(),
                          tablet: OrderItemCardShimmer(),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
              ),
            ),
            child: const TextActionL(
              "Buat Pesanan Baru",
              color: TColors.neutralLightLightest,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
