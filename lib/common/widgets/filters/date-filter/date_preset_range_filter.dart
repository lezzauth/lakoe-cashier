import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/form/date_range_picker.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class DatePresetRangeFilter extends StatefulWidget {
  const DatePresetRangeFilter({
    super.key,
    this.from,
    this.to,
    this.template = "TODAY",
    this.preset = "TODAY",
    this.duration,
    required this.onChanged,
  });

  final String? from;
  final String? to;
  final String? template;
  final String? preset;
  final int? duration;
  final Function({
    DateTime? from,
    DateTime? to,
    String? template,
    String? preset,
    int? duration,
  }) onChanged;

  @override
  State<DatePresetRangeFilter> createState() => _DatePresetRangeFilterState();
}

class _DatePresetRangeFilterState extends State<DatePresetRangeFilter> {
  final List<LabelValue> _templates = [
    const LabelValue(label: "Hari ini", value: "TODAY"),
    const LabelValue(label: "Minggu ini", value: "THISWEEK"),
    const LabelValue(label: "Bulan ini", value: "THISMONTH"),
  ];

  Future<void> _onPickDateRange() async {
    List<DateTime>? ranges = await showModalBottomSheet<List<DateTime>?>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return DateRangePicker(
          from: widget.from == null
              ? DateTime.now()
              : DateTime.parse(widget.from!).toLocal(),
          to: widget.to == null
              ? DateTime.now()
              : DateTime.parse(widget.to!).toLocal(),
        );
      },
    );
    if (ranges == null) return;

    DateTime from = ranges.elementAt(0);
    DateTime to = ranges.elementAt(1);

    widget.onChanged(
      template: null,
      from: from,
      to: to,
      preset: "RANGE",
      duration: from.difference(to).inDays.abs(),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDateRangeSelected = widget.template == null && widget.preset != null;

    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            spacing: 8.0,
            children: _templates.map((template) {
              bool selected = widget.template == template.value;
              return InputChip(
                label: selected
                    ? TextHeading4(
                        template.label,
                        color: TColors.primary,
                      )
                    : TextBodyM(template.label),
                selected: selected,
                onSelected: (value) {
                  widget.onChanged(
                      template: template.value, preset: template.value);
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 34,
            width: 34,
            child: InputChip(
              padding: EdgeInsets.zero,
              label: Container(
                alignment: Alignment.center,
                child: UiIcons(
                  TIcons.calendar,
                  height: 20,
                  width: 20,
                  color: isDateRangeSelected
                      ? TColors.primary
                      : TColors.neutralDarkDarkest,
                ),
              ),
              selected: isDateRangeSelected,
              onSelected: (value) {
                _onPickDateRange();
                // Navigator.pushNamed(context, "/cashier/transaction-date");
              },
            ),
          ),
        ],
      ),
    );
  }
}
