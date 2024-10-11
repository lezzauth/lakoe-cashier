import 'package:flutter/material.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/sections/order_status_section/order_status_description.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/tags/order_item_status_tag.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class OrderStatusSection extends StatefulWidget {
  const OrderStatusSection({
    super.key,
    required this.order,
  });

  final OrderDetailModel order;

  @override
  State<OrderStatusSection> createState() => _OrderStatusSectionState();
}

class _OrderStatusSectionState extends State<OrderStatusSection> {
  @override
  Widget build(BuildContext context) {
    final isShowHistory =
        !["WAITING_FOR_PAYMENT", "CONFIRMED"].contains(widget.order.status);

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: UiIcons(
              TIcons.document2,
              color: TColors.primary,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: OrderItemStatusTag(status: widget.order.status),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: OrderStatusDescription(
                    order: widget.order,
                  ),
                ),
                // if (isShowHistory)
                //   GestureDetector(
                //     onTap: () {
                //       //
                //     },
                //     child: Row(
                //       children: [
                //         TextActionL(
                //           "Lihat Riwayat Pesanan",
                //           color: TColors.primary,
                //         ),
                //         SizedBox(width: 4),
                //         UiIcons(
                //           TIcons.arrowDown,
                //           color: TColors.primary,
                //         )
                //       ],
                //     ),
                //   ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
