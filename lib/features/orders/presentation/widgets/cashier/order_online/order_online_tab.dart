import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/ui/empty/empty_list.dart';
import 'package:lakoe_pos/features/orders/data/arguments/order_detail_argument.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_online/filter/order_online_filter.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_online/order_list/order_online_list_item.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class OrderCashierOnline extends StatefulWidget {
  const OrderCashierOnline({super.key});

  @override
  State<OrderCashierOnline> createState() => _OrderCashierOnlineState();
}

class _OrderCashierOnlineState extends State<OrderCashierOnline> {
  String? previousScreen;
  List<dynamic> orders = [];

  @override
  void initState() {
    super.initState();
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
                child: OrderOnlineFilter(),
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
