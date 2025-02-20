import 'package:flutter/material.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/sections/order_status_section/order_status_description.dart';
import 'package:lakoe_pos/features/online_shop/presentation/widgets/tags/order_item_status_tag.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

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
