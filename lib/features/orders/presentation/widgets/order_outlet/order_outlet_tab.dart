import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/empty/empty_list.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/orders/common/widgets/order_list_item/order_list_item.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_outlet/filter/order_outlet_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class OrderOutletTab extends StatefulWidget {
  const OrderOutletTab({super.key});

  @override
  State<OrderOutletTab> createState() => _OrderOutletTabState();
}

class _OrderOutletTabState extends State<OrderOutletTab> {
  List<dynamic> _orders = [1, 2, 3, 4];
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
                  child: OrderOutletFilter(),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      if (_orders.isNotEmpty)
                        SliverList.builder(
                          itemBuilder: (context, index) {
                            return OrderListItem(
                              isWithQR: index % 2 == 0,
                              isPaid: index % 2 == 0,
                              type: index % 2 == 0 ? "dine_in" : "takeaway",
                              onTap: () {
                                Navigator.pushNamed(context, "/orders/detail");
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
        floatingActionButton: SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              ),
            ),
            child: TextActionL(
              "Buat Pesanan Baru",
              color: TColors.neutralLightLightest,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
