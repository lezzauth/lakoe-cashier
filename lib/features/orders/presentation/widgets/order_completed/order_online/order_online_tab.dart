import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/filters/order_date_filter.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_online/order_list/order_online_list_item.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class OrderOnlineCompletedTab extends StatefulWidget {
  const OrderOnlineCompletedTab({super.key});

  @override
  State<OrderOnlineCompletedTab> createState() =>
      _OrderOnlineCompletedTabState();
}

class _OrderOnlineCompletedTabState extends State<OrderOnlineCompletedTab> {
  String? previousScreen;
  List<dynamic> _orders = [];

  @override
  void initState() {
    super.initState();
    // context.read<OrderMasterCubit>().init();
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
                    if (_orders.isNotEmpty)
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
                    if (_orders.isEmpty)
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
