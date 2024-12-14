import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/shimmer/order_item_shimmer.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_filter_state.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/master/order_outlet/filter/order_outlet_filter.dart';
import 'package:order_repository/order_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_cubit.dart';
import 'package:lakoe_pos/features/orders/application/cubit/orders/orders_state.dart';
import 'package:lakoe_pos/features/orders/common/widgets/order_list_item/order_list_item.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

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

  Future<void> onRefresh() async {
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

  @override
  Widget build(BuildContext context) {
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
                  child: BlocBuilder<OrdersFilterCubit, OrdersFilterState>(
                    builder: (context, state) {
                      return OrderOutletFilter(
                        value: state.toFindAllOrderDto,
                        isFilterUsed: _isFilterUsed,
                        onChanged: (value) {
                          final cubit = context.read<OrdersFilterCubit>();

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
                      );
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<OrdersCubit, OrdersState>(
                    builder: (context, state) {
                      if (state is OrdersLoadSuccess) {
                        final orders = state.orders;

                        return CustomScrollView(
                          slivers: [
                            if (orders.isNotEmpty) ...[
                              SliverList.builder(
                                itemCount: orders.length,
                                itemBuilder: (context, index) {
                                  OrderItemRes order = orders.elementAt(index);

                                  return OrderListItem(
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
                      } else if (state is OrdersLoadFailure) {
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
                        return OrderItemShimmer();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
