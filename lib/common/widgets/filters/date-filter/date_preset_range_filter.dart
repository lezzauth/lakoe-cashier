import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/form/date_range_picker.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    const LabelValue(label: "Tentukan Tanggal", value: "CUSTOM"),
  ];

  bool _isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  DateTime _startOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  DateTime _endOfWeek(DateTime date) {
    return date.add(Duration(days: DateTime.daysPerWeek - date.weekday));
  }

  Future<void> _onPickDateRange() async {
    final today = DateTime.now();
    DateTime from =
        widget.from == null ? today : DateTime.parse(widget.from!).toLocal();
    DateTime to =
        widget.to == null ? today : DateTime.parse(widget.to!).toLocal();

    if (widget.from == null && widget.to == null) {
      final startOfWeek = _startOfWeek(today);
      final endOfWeek = _endOfWeek(today);
      final startOfMonth = DateTime(today.year, today.month, 1);
      final endOfMonth = DateTime(today.year, today.month + 1, 0);

      switch (widget.template) {
        case "TODAY":
          from = today;
          to = today;
          break;
        case "THISWEEK":
          from = startOfWeek;
          to = endOfWeek;
          break;
        case "THISMONTH":
          from = startOfMonth;
          to = endOfMonth;
          break;
      }
    }

    List<DateTime>? ranges = await showModalBottomSheet<List<DateTime>?>(
      context: context,
      builder: (context) {
        return CustomBottomsheet(
          child: DateRangePicker(
            from: from,
            to: to,
          ),
        );
      },
    );
    if (ranges == null) return;

    from = ranges.elementAt(0);
    to = ranges.elementAt(1);

    String? template;
    final startOfToday = DateTime(today.year, today.month, today.day);
    final startOfWeek = _startOfWeek(today);
    final endOfWeek = _endOfWeek(today);
    final startOfMonth = DateTime(today.year, today.month, 1);
    final endOfMonth = DateTime(today.year, today.month + 1, 0);

    if (_isSameDate(from, startOfToday) && _isSameDate(to, startOfToday)) {
      template = "TODAY";
    } else if (_isSameDate(from, startOfWeek) && _isSameDate(to, endOfWeek)) {
      template = "THISWEEK";
    } else if (_isSameDate(from, startOfMonth) && _isSameDate(to, endOfMonth)) {
      template = "THISMONTH";
    }

    if (!mounted) return;

    widget.onChanged(
      template: template,
      from: from,
      to: to,
      preset: template ?? "RANGE",
      duration: from.difference(to).inDays.abs(),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    bool isDateRangeSelected = widget.template == null && widget.preset != null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Wrap(
                spacing: 8.0,
                children: _templates
                    .where(
                        (template) => !(isMobile && template.value == "CUSTOM"))
                    .map((template) {
                  bool selected = widget.template == template.value;
                  return InputChip(
                    label: (selected ||
                            (template.value == "CUSTOM" && isDateRangeSelected))
                        ? TextHeading4(
                            template.label,
                            color: TColors.primary,
                          )
                        : TextBodyM(template.label),
                    selected: (template.value == "CUSTOM")
                        ? isDateRangeSelected
                        : selected,
                    onSelected: (value) {
                      if (template.value == "CUSTOM") {
                        _onPickDateRange();
                      } else {
                        widget.onChanged(
                          template: template.value,
                          preset: template.value,
                        );
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        if (isMobile)
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.only(right: 20, left: 8, top: 4, bottom: 4),
            child: SizedBox(
              height: 34,
              width: 34,
              child: InputChip(
                padding: EdgeInsets.zero,
                label: Container(
                  alignment: Alignment.center,
                  child: UiIcons(
                    TIcons.calendar,
                    size: 20,
                    color: isDateRangeSelected
                        ? TColors.primary
                        : TColors.neutralDarkDarkest,
                  ),
                ),
                selected: isDateRangeSelected,
                onSelected: (value) {
                  _onPickDateRange();
                },
              ),
            ),
          ),
      ],
    );
  }
}
