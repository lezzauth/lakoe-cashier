import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/shimmer/order_item_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/order_detail/order_detail_state.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_state.dart';
import 'package:lakoe_pos/features/orders/common/widgets/order_item/order_card_item.dart';
import 'package:lakoe_pos/features/orders/common/widgets/order_item/order_list_item.dart';
import 'package:lakoe_pos/features/orders/presentation/screens/tablet/order_detail_tablet.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/master/order_outlet/filter/order_outlet_filter.dart';
import 'package:lakoe_pos/features/payment_method/application/payment_method_cubit.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_state.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OrderOutlet extends StatefulWidget {
  const OrderOutlet({
    super.key,
    this.searchController,
    this.searchFocusNode,
  });

  final TextEditingController? searchController;
  final FocusNode? searchFocusNode;

  @override
  State<OrderOutlet> createState() => _OrderOutletState();
}

class _OrderOutletState extends State<OrderOutlet> {
  bool _isFilterUsed = false;
  String _keywordSearch = "";

  Future<void> _onRefresh() async {
    OrdersFilterState filterState = context.read<OrdersFilterCubit>().state;

    final updatedFilterState = filterState.sort == null
        ? filterState.copyWith(sort: 'NEWEST')
        : filterState;

    await context
        .read<OrdersCubit>()
        .findAll(updatedFilterState.toFindAllOrderDto);
  }

  @override
  void initState() {
    super.initState();
    context.read<OrdersCubit>().init();
    context.read<PaymentMethodCubit>().findAll();
    context.read<OrderDetailOpenedCubit>().unselectOrderId();
  }

  void _handleClearFilter() {
    if (_keywordSearch.isNotEmpty) {
      widget.searchFocusNode!.requestFocus();
      widget.searchController!.selection = TextSelection(
        baseOffset: 0,
        extentOffset: widget.searchController!.text.length,
      );
    } else {
      context.read<OrdersFilterCubit>().clearFilter();
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
      return "Saat ini kamu belum pernah melakukan transaksi sama sekali.";
    } else if (_keywordSearch.isNotEmpty) {
      return "Coba cari dengan no. order, no. meja atau nama pelanggan yang lain";
    } else {
      return "Ubah tanggal atau hapus filter untuk melihat penjualan kamu.";
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

  void _onOrderSelected(String? orderId) {
    final cubit = context.read<OrderDetailOpenedCubit>();
    bool selected = orderId == cubit.state.selectedId;

    if (cubit.state.selectedId == null || !selected) {
      cubit.selectOrderId(orderId!);
    } else {
      cubit.unselectOrderId();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return MultiBlocListener(
      listeners: [
        BlocListener<OrdersCubit, OrdersState>(
          listener: (context, state) {},
        ),
        BlocListener<OrdersFilterCubit, OrdersFilterState>(
          listener: (context, state) {
            context.read<OrdersCubit>().findAll(state.toFindAllOrderDto);

            setState(() {
              _keywordSearch = state.toFindAllOrderDto.search ?? "";
            });
          },
        )
      ],
      child: Scaffold(
        backgroundColor:
            isMobile ? TColors.neutralLightLightest : TColors.neutralLightLight,
        body: Row(
          children: [
            Expanded(
              child: Scrollbar(
                child: RefreshIndicator(
                  onRefresh: _onRefresh,
                  backgroundColor: TColors.neutralLightLightest,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<OrdersFilterCubit, OrdersFilterState>(
                        builder: (context, stateFilter) {
                          return BlocBuilder<OrderDetailOpenedCubit,
                                  OrderDetailOpenedState>(
                              builder: (context, state) {
                            return SingleChildScrollView(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              physics: (isMobile || state.selectedId == null)
                                  ? NeverScrollableScrollPhysics()
                                  : AlwaysScrollableScrollPhysics(),
                              scrollDirection:
                                  (isMobile || state.selectedId == null)
                                      ? Axis.vertical
                                      : Axis.horizontal,
                              child: OrderOutletFilter(
                                value: stateFilter.toFindAllOrderDto,
                                isFilterUsed: _isFilterUsed,
                                onClear: () {
                                  setState(() {
                                    _isFilterUsed = false;
                                  });
                                  context
                                      .read<OrdersFilterCubit>()
                                      .clearFilter();
                                },
                                onChanged: (value) {
                                  final cubit =
                                      context.read<OrdersFilterCubit>();

                                  DateTime? parseDate(String? date) {
                                    if (date == null) return null;
                                    return DateTime.parse(date);
                                  }

                                  final from = parseDate(value.from);
                                  final to = parseDate(value.to);

                                  cubit.setFilter(
                                    sort: value.sort,
                                    source: value.source,
                                    type: value.type,
                                    status: value.status,
                                    template: value.template,
                                    from: from,
                                    to: to,
                                  );

                                  setState(() {
                                    _isFilterUsed = cubit.hasFilterChanged();
                                  });
                                },
                              ),
                            );
                          });
                        },
                      ),
                      Expanded(
                        child: BlocBuilder<OrdersCubit, OrdersState>(
                          builder: (context, state) {
                            if (state is OrdersLoadSuccess) {
                              final orders = state.orders;

                              final groupedOrders = groupBy(
                                orders,
                                (OrderItemRes order) {
                                  final date = order.createdAt.split('T')[0];
                                  return date;
                                },
                              );

                              return CustomScrollView(
                                slivers: [
                                  if (orders.isNotEmpty) ...[
                                    ResponsiveLayout(
                                      mobile: MobileOrdersView(
                                        groupedOrders: groupedOrders,
                                        onRefresh: _onRefresh,
                                      ),
                                      tablet: BlocBuilder<
                                              OrderDetailOpenedCubit,
                                              OrderDetailOpenedState>(
                                          builder: (context, state) {
                                        return TabletOrdersView(
                                          orders: orders,
                                          selectedOrderId: state.selectedId,
                                          onOrderSelected: _onOrderSelected,
                                        );
                                      }),
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
                            } else if (state is OrdersLoadFailure) {
                              return EmptyList(
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
            ),
            BlocBuilder<OrderDetailOpenedCubit, OrderDetailOpenedState>(
                builder: (context, state) {
              return Visibility(
                visible: state.selectedId != null,
                child: OrderDetailTablet(
                  key: ValueKey(state.selectedId),
                  arguments: OrderDetailArgument(id: state.selectedId ?? ""),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class MobileOrdersView extends StatelessWidget {
  final Map<String, List<OrderItemRes>> groupedOrders;
  final Function _onRefresh;
  const MobileOrdersView({
    super.key,
    required this.groupedOrders,
    required Function onRefresh,
  }) : _onRefresh = onRefresh;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          String date = groupedOrders.keys.elementAt(index);
          List<OrderItemRes> ordersByDate = groupedOrders[date]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  16,
                  index == 0 ? 8 : 24,
                  16,
                  0,
                ),
                child: TextHeading5(
                  "${TFormatter.dateTime(date, withTime: false)} (${ordersByDate.length} pesanan)",
                  color: TColors.neutralDarkLightest,
                ),
              ),
              ...ordersByDate.map((order) {
                return OrderListItem(
                  order: order,
                  onTap: () async {
                    bool? result = await Navigator.pushNamed(
                      context,
                      "/orders/detail",
                      arguments: OrderDetailArgument(
                        id: order.id,
                      ),
                    ) as bool?;

                    if (result == true) {
                      _onRefresh();
                    }
                  },
                );
              }),
            ],
          );
        },
        childCount: groupedOrders.keys.length,
      ),
    );
  }
}

class TabletOrdersView extends StatelessWidget {
  final List<OrderItemRes> orders;
  final String? selectedOrderId;
  final ValueChanged<String?> onOrderSelected;

  const TabletOrdersView({
    super.key,
    required this.orders,
    required this.selectedOrderId,
    required this.onOrderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 360,
          mainAxisExtent: 115.5,
          childAspectRatio: 360 / 115.5,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          OrderItemRes order = orders.elementAt(index);

          bool selectedItem = selectedOrderId == order.id;

          return OrderCardItem(
            selected: selectedItem,
            order: order,
            onTap: () {
              onOrderSelected(order.id);
            },
          );
        },
      ),
    );
  }
}
