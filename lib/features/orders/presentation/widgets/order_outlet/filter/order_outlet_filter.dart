import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_outlet/filter/order_outlet_advanced_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class OrderOutletFilter extends StatefulWidget {
  const OrderOutletFilter({super.key});

  @override
  State<OrderOutletFilter> createState() => _OrderOutletFilterState();
}

class _OrderOutletFilterState extends State<OrderOutletFilter> {
  bool isFilterUsed = false;

  @override
  Widget build(BuildContext context) {
    onFilterOpen() {
      return showModalBottomSheet(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (context) {
          return OrderOutletAdvancedFilter(
            onFilterChanged: () {
              setState(() {
                isFilterUsed = true;
              });
            },
          );
        },
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          spacing: 8.0,
          children: [
            InputChip(
              label: TextHeading5(
                "Berlangsung",
                color: TColors.primary,
              ),
              selected: true,
              onPressed: () {},
            ),
            InputChip(
              label: TextBodyS(
                "Selesai",
                color: TColors.neutralDarkDarkest,
              ),
              onPressed: () {},
            ),
          ],
        ),
        InputChip(
          label: Row(
            children: [
              UiIcons(
                TIcons.filter,
                color: TColors.primary,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              TextBodyS(
                "Filter",
                color: TColors.neutralDarkDarkest,
              ),
              if (isFilterUsed) ...[
                const SizedBox(width: 4),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: TColors.error,
                  ),
                )
              ],
            ],
          ),
          onPressed: onFilterOpen,
        ),
      ],
    );
  }
}
