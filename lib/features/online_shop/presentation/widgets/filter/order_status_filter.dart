import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/online_shop/utils/constants/order_status_label.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class OrderStatusFilter extends StatefulWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const OrderStatusFilter({
    super.key,
    this.value,
    required this.onChanged,
  });

  @override
  State<OrderStatusFilter> createState() => _OrderStatusFilterState();
}

List<LabelValue> statuses = [
  LabelValue(
    label: OrderStatusLabel.getLabel("WAITING_FOR_PAYMENT"),
    value: "WAITING_FOR_PAYMENT",
  ),
  LabelValue(
    label: OrderStatusLabel.getLabel("CONFIRMED"),
    value: "CONFIRMED",
  ),
  LabelValue(
    label: OrderStatusLabel.getLabel("READY"),
    value: "READY",
  ),
  LabelValue(
    label: OrderStatusLabel.getLabel("ON_DELIVERY"),
    value: "ON_DELIVERY",
  ),
  LabelValue(
    label: OrderStatusLabel.getLabel(
      "COMPLETED",
    ),
    value: "COMPLETED",
  ),
];

class _OrderStatusFilterState extends State<OrderStatusFilter> {
  @override
  Widget build(BuildContext context) {
    bool isSelectAll = widget.value == null;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 8.0,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ChoiceChip(
            label: isSelectAll
                ? const TextHeading5(
                    "Semua",
                    color: TColors.primary,
                  )
                : const TextBodyS("Semua"),
            selected: isSelectAll,
            onSelected: (value) {
              widget.onChanged(null);
            },
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            children: statuses.map((status) {
              bool selected = status.value == widget.value;
              return ChoiceChip(
                label: selected
                    ? TextHeading5(
                        status.label,
                        color: TColors.primary,
                      )
                    : TextBodyS(status.label),
                selected: selected,
                onSelected: (value) {
                  widget.onChanged(status.value);
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
