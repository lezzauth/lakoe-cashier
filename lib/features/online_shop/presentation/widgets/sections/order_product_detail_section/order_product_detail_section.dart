import 'package:flutter/material.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OrderProductDetailSection extends StatefulWidget {
  const OrderProductDetailSection({super.key, required this.order});

  final OrderDetailModel order;

  @override
  State<OrderProductDetailSection> createState() =>
      _OrderProductDetailSectionState();
}

class _OrderProductDetailSectionState extends State<OrderProductDetailSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: UiIcons(
              TIcons.box2,
              color: TColors.primary,
              size: 24,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: TextHeading4("Detail Produk"),
                ),
                ...widget.order.items.map(
                  (item) {
                    return _ProductCard(item: item);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.item});

  final OrderDetailItem item;

  @override
  Widget build(BuildContext context) {
    String? image = item.product.images.elementAtOrNull(0);
    image ??= "https://placehold.co/88/png?text=[...]";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: TColors.neutralLightMedium,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.only(right: 8),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              image,
              height: 52,
              width: 52,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: TextHeading4(
                    item.product.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                TextBodyM(
                    "${item.quantity} x ${TFormatter.formatToRupiah(double.parse(item.product.price))}")
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: TextBodyM(
                  "Total belanja",
                  color: TColors.neutralDarkLight,
                ),
              ),
              TextActionL(TFormatter.formatToRupiah(double.parse(item.price)))
            ],
          ),
        ],
      ),
    );
  }
}
