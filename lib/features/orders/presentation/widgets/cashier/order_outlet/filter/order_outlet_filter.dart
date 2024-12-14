import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/cashier/order_outlet/filter/order_outlet_advanced_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class OrderOutletFilter extends StatefulWidget {
  final FindAllOrderCashierDto value;
  final ValueChanged<FindAllOrderCashierDto> onChanged;
  final bool isFilterUsed;

  const OrderOutletFilter({
    super.key,
    required this.value,
    required this.onChanged,
    this.isFilterUsed = false,
  });

  @override
  State<OrderOutletFilter> createState() => _OrderOutletFilterState();
}

class _OrderOutletFilterState extends State<OrderOutletFilter> {
  bool _isFilterUsed = false;

  List<LabelValue<String>> statuses = [
    const LabelValue(label: "Berlangsung", value: "OPEN"),
    const LabelValue(label: "Selesai", value: "COMPLETED"),
    // const LabelValue(label: "Dibatalkan", value: "CANCELLED"),
  ];

  @override
  Widget build(BuildContext context) {
    onFilterOpen() async {
      final result = await showModalBottomSheet<Map<String, dynamic>>(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return CustomBottomsheet(
            child: OrderOutletAdvancedFilter(
              value: widget.value,
              onFilterChanged: (value) {
                widget.onChanged(value);
              },
            ),
          );
        },
      );

      if (result != null) {
        setState(() {
          _isFilterUsed = result['isFilterUsed'] as bool;
        });
      }
    }

    bool isFilterActive = widget.isFilterUsed && _isFilterUsed;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Wrap(
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
                    widget.onChanged(
                      widget.value.copyWith(
                        status: status.value,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 8),
          child: InputChip(
            selected: isFilterActive,
            label: Row(
              children: [
                UiIcons(
                  (!isFilterActive) ? TIcons.filter : TIcons.filterBold,
                  color: TColors.primary,
                  size: 16,
                ),
                SizedBox(width: 4),
                (!isFilterActive)
                    ? TextBodyM(
                        "Filter",
                        color: TColors.neutralDarkDarkest,
                      )
                    : TextHeading4(
                        "Filter",
                        color: TColors.primary,
                      ),
              ],
            ),
            onPressed: onFilterOpen,
          ),
        ),
      ],
    );
  }
}
