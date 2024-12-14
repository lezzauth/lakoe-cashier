import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/customers/presentation/widgets/filter_status_content.dart';
import 'package:lakoe_pos/features/orders/common/widgets/filters/order_date_filter.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:outlet_repository/outlet_repository.dart';

class FilterOrdersByCustomer extends StatefulWidget {
  final DetailCustomerOutletDto value;
  final ValueChanged<DetailCustomerOutletDto> onChanged;
  final Function()? onClear;

  const FilterOrdersByCustomer({
    super.key,
    required this.value,
    required this.onChanged,
    this.onClear,
  });

  @override
  State<FilterOrdersByCustomer> createState() => _FilterOrdersByCustomerState();
}

class _FilterOrdersByCustomerState extends State<FilterOrdersByCustomer> {
  final List<LabelValue<String>> _statuses = [
    const LabelValue(label: "Berlangsung", value: "OPEN"),
    const LabelValue(label: "Selesai", value: "COMPLETED"),
    const LabelValue(label: "Terhutang", value: "CLOSED"),
    const LabelValue(label: "Dibatalkan", value: "CANCELLED"),
  ];

  Future<void> _onSelected() async {
    String? result = await showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: FilterStatusContent(
            status: widget.value.status ?? "ALL",
          ),
        );
      },
    );
    if (result == null) return;
    widget.onChanged(widget.value.copyWith(status: result));
  }

  String _display() {
    final status = _statuses.firstWhere(
      (status) => status.value == widget.value.status,
      orElse: () => const LabelValue(label: "Semua Status", value: "ALL"),
    );
    return status.value == "ALL" ? status.label : "Status: ${status.label}";
  }

  @override
  Widget build(BuildContext context) {
    bool isFilterUsed = widget.value.template != null ||
        widget.value.from != null ||
        widget.value.status != null;

    bool statusNotEmpty = widget.value.status != null;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(right: 8),
              child: OrderDateFilter(
                template: widget.value.from != null || widget.value.to != null
                    ? "CUSTOM"
                    : (widget.value.template ?? "ALL"),
                from: widget.value.from,
                to: widget.value.to,
                onChanged: (template, from, to) {
                  widget.onChanged(widget.value.copyWith(
                    template:
                        (from != null || to != null) ? "CUSTOM" : template,
                    from: from?.toIso8601String(),
                    to: to?.toIso8601String(),
                  ));
                },
              ),
            ),
            ResponsiveLayout(
              mobile: FilterChip(
                onSelected: (value) {
                  _onSelected();
                },
                onDeleted: statusNotEmpty
                    ? () {
                        widget.onChanged(
                          widget.value.copyWith(status: "ALL"),
                        );
                      }
                    : null,
                deleteIconColor: TColors.neutralDarkLightest,
                clipBehavior: Clip.antiAlias,
                label: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextBodyM(_display()),
                    if (!statusNotEmpty) ...[
                      const SizedBox(width: 8),
                      const UiIcons(
                        TIcons.arrowDown,
                        size: 12,
                        color: TColors.neutralDarkLightest,
                      ),
                    ]
                  ],
                ),
              ),
              tablet: ClipRect(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
      ),
    );
  }
}
