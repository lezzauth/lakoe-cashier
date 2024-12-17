import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
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
  final Function()? onClear;

  const OrderOutletFilter({
    super.key,
    required this.value,
    required this.onChanged,
    this.isFilterUsed = false,
    this.onClear,
  });

  @override
  State<OrderOutletFilter> createState() => _OrderOutletFilterState();
}

class _OrderOutletFilterState extends State<OrderOutletFilter> {
  bool _isFilterUsed = false;

  final List<LabelValue<String>> _statuses = [
    const LabelValue(label: "Berlangsung", value: "OPEN"),
    const LabelValue(label: "Selesai", value: "COMPLETED"),
    const LabelValue(label: "Terhutang", value: "CLOSED"),
    const LabelValue(label: "Dibatalkan", value: "CANCELLED"),
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

    bool isFilterUsed = widget.value.template != null ||
        widget.value.from != null ||
        widget.value.status != null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IntrinsicWidth(
              child: OrderDateFilter(
                template: widget.value.template ?? "ALL",
                from: widget.value.from,
                to: widget.value.to,
                onChanged: (template, from, to) {
                  widget.onChanged(widget.value.copyWith(
                    template: template,
                    from: from?.toIso8601String(),
                    to: to?.toIso8601String(),
                  ));
                },
              ),
            ),
            ResponsiveLayout(
              mobile: SizedBox.shrink(),
              tablet: ClipRect(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 8),
                  clipBehavior: Clip.none,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8, left: 12),
                        child: TextHeading4("Status:"),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        spacing: 8.0,
                        children: _statuses.map((status) {
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
                              if (selected) {
                                widget.onChanged(
                                  widget.value.copyWith(status: "ALL"),
                                );
                              } else {
                                widget.onChanged(
                                  widget.value.copyWith(status: status.value),
                                );
                              }
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(width: 8),
                      if (isFilterUsed)
                        TextButton(
                          onPressed: widget.onClear,
                          child: const TextActionL(
                            "Hapus Filter",
                            color: TColors.primary,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
