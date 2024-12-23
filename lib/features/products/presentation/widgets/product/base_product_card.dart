import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class BaseProductCard extends StatelessWidget {
  final String name;
  final Widget image;
  final int price;
  final bool selected;
  final Widget? counter;

  const BaseProductCard({
    super.key,
    this.name = "",
    required this.image,
    this.price = 0,
    this.selected = false,
    this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color:
            selected ? TColors.highlightLightest : TColors.neutralLightLightest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            width: 1,
            color: selected
                ? TColors.highlightMedium
                : TColors.neutralLightMedium),
      ),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: TColors.neutralLightMedium,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                height: 165.5,
                width: 208,
                child: image,
              ),
              if (counter != null) counter!,
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextHeading3(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: TextBodyM(
                      TFormatter.formatToRupiah(price),
                      color: TColors.neutralDarkLight,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
