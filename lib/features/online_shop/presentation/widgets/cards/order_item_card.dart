import 'package:flutter/material.dart';
import 'package:online_shop_repository/online_shop_repository.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/online_shop/presentation/widgets/tags/order_item_status_tag.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key, required this.order, this.onTap});

  final OrderModel order;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final firstProduct = order.items[0].product;

    String? image = firstProduct.images.elementAtOrNull(0);
    image ??= "https://placehold.co/88/png?text=[...]";

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: TColors.neutralLightMedium,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: TColors.neutralLightMedium,
                  ),
                ),
              ),
              child: Row(
                children: [
                  OrderItemStatusTag(status: order.status),
                  Expanded(
                    child: TextBodyS(
                      order.invoiceNumber,
                      color: TColors.neutralDarkLight,
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      image,
                      height: 52,
                      width: 52,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: TextHeading4(
                                  firstProduct.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TextBodyS(
                                '${order.items.length} Barang',
                                color: TColors.neutralDarkLight,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: TextBodyM(
                                  "Total belanja",
                                  color: TColors.neutralDarkLight,
                                ),
                              ),
                              TextHeading4(
                                TFormatter.formatToRupiah(
                                  double.parse(order.price),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
