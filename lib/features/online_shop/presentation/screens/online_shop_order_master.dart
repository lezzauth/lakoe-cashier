import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_cubit.dart';
import 'package:lakoe_pos/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_filter_cubit.dart';
import 'package:lakoe_pos/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_filter_state.dart';
import 'package:lakoe_pos/features/online_shop/application/cubit/shop_order_master_cubit/shop_order_master_state.dart';
import 'package:lakoe_pos/features/online_shop/data/arguments/online_shop_order_detail_argument.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/cards/order_item_card.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/filter/order_status_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class OnlineShopOrderMasterScreen extends StatelessWidget {
  const OnlineShopOrderMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopOrderMasterFilterCubit(),
      child: OnlineShopOrderMaster(),
    );
  }
}

class OnlineShopOrderMaster extends StatefulWidget {
  const OnlineShopOrderMaster({super.key});

  @override
  State<OnlineShopOrderMaster> createState() => _OnlineShopOrderMasterState();
}

class _OnlineShopOrderMasterState extends State<OnlineShopOrderMaster> {
  Future<void> _onInit() async {
    context.read<ShopOrderMasterCubit>().findAll(dto: FindAllOrderDto());
  }

  Future<void> _onRefresh() async {
    final filterState = context.read<ShopOrderMasterFilterCubit>().state;

    context
        .read<ShopOrderMasterCubit>()
        .findAll(dto: FindAllOrderDto(status: filterState.status));
  }

  Future<void> _onGoToDetailScreen(OrderModel order) async {
    await Navigator.pushNamed(context, "/online_shop/orders/detail",
        arguments: OnlineShopOrderDetailArgument(order: order));
    _onRefresh();
  }

  @override
  void initState() {
    super.initState();

    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopOrderMasterFilterCubit, ShopOrderMasterFilterState>(
      listener: (context, filterState) {
        context
            .read<ShopOrderMasterCubit>()
            .findAll(dto: FindAllOrderDto(status: filterState.status));
      },
      child: Scaffold(
        appBar: CustomAppbar(
          search: SearchField(
            hintText: "Cari pesanan disini",
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: BlocBuilder<ShopOrderMasterFilterCubit,
                ShopOrderMasterFilterState>(builder: (context, state) {
              return OrderStatusFilter(
                value: state.status,
                onChanged: (status) {
                  context
                      .read<ShopOrderMasterFilterCubit>()
                      .setFilter(status: status);
                },
              );
            }),
          ),
        ),
        body: Scrollbar(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            backgroundColor: TColors.neutralLightLightest,
            child: BlocBuilder<ShopOrderMasterCubit, ShopOrderMasterState>(
              builder: (context, state) => switch (state) {
                ShopOrderMasterLoadSuccess(:final orders) => orders.isEmpty
                    ? EmptyList(
                        title: "Belum ada pesanan, nih!",
                        subTitle:
                            "Hari ini belum ada pesanan dari toko online kamu. Yuk! promosikan lagi.",
                        image: SvgPicture.asset(
                          TImages.catBox,
                          width: 276,
                          height: 200,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            final order = orders.elementAt(index);

                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: OrderItemCard(
                                order: order,
                                onTap: () {
                                  _onGoToDetailScreen(order);
                                },
                              ),
                            );
                          },
                        ),
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
