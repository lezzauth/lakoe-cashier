import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/order_list_item/order_list_item.dart';
import 'package:point_of_sales_cashier/features/orders/data/arguments/order_detail_argument.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_online/filter/order_online_filter.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_online/order_list/order_online_list_item.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_outlet/filter/order_outlet_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class OrderOnlineTab extends StatefulWidget {
  const OrderOnlineTab({super.key});

  @override
  State<OrderOnlineTab> createState() => _OrderOnlineTabState();
}

class _OrderOnlineTabState extends State<OrderOnlineTab> {
  List<dynamic> _orders = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(Duration(seconds: 1));
          },
          backgroundColor: TColors.neutralLightLightest,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: OrderOnlineFilter(),
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
                              "Hari ini belum ada pesanan masuk. Yuk, bikin pesanan pertama untuk hari ini.",
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
