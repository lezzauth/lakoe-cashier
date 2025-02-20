import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/features/orders/common/widgets/filters/order_date_filter.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_online/order_list/order_online_list_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class OrderOnline extends StatefulWidget {
  const OrderOnline({super.key});

  @override
  State<OrderOnline> createState() => _OrderOnlineState();
}

class _OrderOnlineState extends State<OrderOnline> {
  String? previousScreen;
  List<dynamic> orders = [];

  @override
  void initState() {
    super.initState();
    // context.read<OrderCashierCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(const Duration(seconds: 1));
          },
          backgroundColor: TColors.neutralLightLightest,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: IntrinsicWidth(
                  child: OrderDateFilter(
                    // from: "",
                    template: "ALL",
                    // to: "",
                    onChanged: (template, from, to) {},
                  ),
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    if (orders.isNotEmpty)
                      SliverList.builder(
                        itemBuilder: (context, index) {
                          return OrderOnlineListItem(
                            status: "declined",
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/orders/detail",
                                arguments: OrderDetailArgument(
                                  id: index.toString(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    if (orders.isEmpty)
                      SliverToBoxAdapter(
                        child: EmptyList(
                          image: SvgPicture.asset(
                            TImages.catBox,
                            width: 276,
                            height: 200,
                          ),
                          title: "Belum ada pesanan, nih!",
                          subTitle:
                              "Saat ini belum ada pesanan masuk dari toko online kamu.",
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
