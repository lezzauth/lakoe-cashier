import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/features/orders/presentation/widgets/order_outlet/filter/order_outlet_advanced_filter.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class OrderOutletFilter extends StatefulWidget {
  final FindAllOrderDto value;
  final ValueChanged<FindAllOrderDto> onChanged;

  const OrderOutletFilter({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<OrderOutletFilter> createState() => _OrderOutletFilterState();
}

class _OrderOutletFilterState extends State<OrderOutletFilter> {
  bool isFilterUsed = false;

  List<LabelValue<String>> statuses = [
    const LabelValue(label: "Berlangsung", value: "OPEN"),
    const LabelValue(label: "Selesai", value: "COMPLETED"),
  ];

  @override
  Widget build(BuildContext context) {
    onFilterOpen() {
      return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return CustomBottomsheet(
            child: OrderOutletAdvancedFilter(
              onFilterChanged: () {
                setState(() {
                  isFilterUsed = true;
                });
              },
            ),
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
          children: statuses.map((status) {
            bool selected = status.value == widget.value.status;
            return InputChip(
              label: selected
                  ? TextHeading4(
                      status.label,
                      color: TColors.primary,
                    )
                  : TextBodyM(
                      status.label,
                      color: TColors.neutralDarkDarkest,
                    ),
              selected: selected,
              onPressed: () {
                widget.onChanged(widget.value.copyWith(status: status.value));
              },
            );
          }).toList(),
        ),
        InputChip(
          label: Row(
            children: [
              const UiIcons(
                TIcons.filter,
                color: TColors.primary,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              const TextBodyM(
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
