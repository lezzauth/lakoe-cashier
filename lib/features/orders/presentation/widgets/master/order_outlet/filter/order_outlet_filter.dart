import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/orders/common/widgets/filters/order_date_filter.dart';
import 'package:lakoe_pos/features/orders/presentation/widgets/master/order_outlet/filter/order_outlet_advanced_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:order_repository/order_repository.dart';

class OrderOutletFilter extends StatefulWidget {
  final FindAllOrderDto value;
  final ValueChanged<FindAllOrderDto> onChanged;
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
        IntrinsicWidth(
          child: OrderDateFilter(
            template: widget.value.template ?? "ALL",
            from: widget.value.from,
            to: widget.value.to,
            onChanged: (template, from, to) {
              widget.onChanged(widget.value.copyWith(
                template: template,
                from: from?.toUtc().toIso8601String(),
                to: to?.toUtc().toIso8601String(),
              ));
            },
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
