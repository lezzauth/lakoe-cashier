import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/helpers/helper.dart';

class DateStepperFilter extends StatefulWidget {
  const DateStepperFilter({
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
  }) onChanged;

  @override
  State<DateStepperFilter> createState() => _DateStepperFilterState();
}

class _DateStepperFilterState extends State<DateStepperFilter> {
  DateTime now = DateTime.now().toUtc();

  String _getFormattedDateBasedOnFilter() {
    DateTime now = DateTime.now();

    // Helper for date format
    String formatDate(DateTime date, String pattern) =>
        DateFormat(pattern, "id_ID").format(date);

    // Check date range (from - to)
    if (widget.from != null && widget.to != null) {
      DateTime parsedFrom = DateTime.parse(widget.from!).toLocal();
      DateTime parsedTo = DateTime.parse(widget.to!).toLocal();

      switch (widget.preset) {
        case "TODAY":
          return formatDate(parsedFrom, "EEEE, dd MMMM yyyy");
        case "THISMONTH":
          return formatDate(parsedFrom, "MMMM yyyy");
        default:
          return "${formatDate(parsedFrom, "dd MMM yyyy")} - ${formatDate(parsedTo, "dd MMM yyyy")}";
      }
    }

    // Check date template
    switch (widget.template) {
      case "TODAY":
        return formatDate(now, "EEEE, dd MMMM yyyy");
      case "THISWEEK":
        List<DateTime> thisWeek = THelper.getStartEndWeek(now);
        return "${formatDate(thisWeek[0], "dd MMM yyyy")} - ${formatDate(thisWeek[1], "dd MMM yyyy")}";
      case "THISMONTH":
        return formatDate(now, "MMMM yyyy");
      default:
        return "";
    }
  }

  List<DateTime> _calculateDateRange(String action) {
    DateTime? from = widget.from == null ? null : DateTime.parse(widget.from!);

    DateTime baseDate = (from ?? now).toLocal();
    DateTime modifiedBaseDate;

    List<DateTime> fromTo = [];

    if (widget.preset == "TODAY") {
      if (action == "next") {
        modifiedBaseDate = baseDate.add(const Duration(days: 1));
      } else {
        modifiedBaseDate = baseDate.subtract(const Duration(days: 1));
      }

      fromTo = THelper.getStartEndDay(modifiedBaseDate);
    }

    if (widget.preset == "THISWEEK") {
      if (action == "next") {
        modifiedBaseDate = baseDate.add(const Duration(days: 7));
      } else {
        modifiedBaseDate = baseDate.subtract(const Duration(days: 7));
      }

      fromTo = THelper.getStartEndWeek(modifiedBaseDate);
    }

    if (widget.preset == "THISMONTH") {
      if (action == "next") {
        modifiedBaseDate = THelper.addOrSubtractMonth(baseDate, "add");
      } else {
        modifiedBaseDate = THelper.addOrSubtractMonth(baseDate, "subtract");
      }

      fromTo = THelper.getStartEndMonth(modifiedBaseDate);
    }

    if (widget.preset == "RANGE") {
      if (action == "next") {
        modifiedBaseDate =
            baseDate.toLocal().add(Duration(days: (widget.duration ?? 1) + 1));
      } else {
        modifiedBaseDate = baseDate
            .toLocal()
            .subtract(Duration(days: (widget.duration ?? 1) + 1));
      }

      DateTime to =
          modifiedBaseDate.add(Duration(days: (widget.duration ?? 1)));
      to = DateTime(to.year, to.month, to.day, 23, 59, 59, 999);

      fromTo = [
        modifiedBaseDate,
        to,
      ];
    }

    return fromTo;
  }

  void _onAction(String action) {
    final [from, to] = _calculateDateRange(action);
    String? template;

    final today = DateTime.now();
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

    widget.onChanged(template: template, from: from, to: to);
  }

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

  @override
  Widget build(BuildContext context) {
    final [from, _] = _calculateDateRange("next");
    bool isNextDisabled =
        from.isAfter(DateTime(now.year, now.month, now.day, 23, 59, 59, 999));

    return SizedBox(
      height: 36,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 36,
              width: 36,
              child: IconButton(
                onPressed: () {
                  _onAction("previous");
                },
                icon: const UiIcons(
                  TIcons.arrowLeft,
                  size: 16,
                  color: TColors.primary,
                ),
              ),
            ),
            Text(
              _getFormattedDateBasedOnFilter(),
              style: GoogleFonts.inter(
                color: TColors.neutralDarkDarkest,
                fontSize: TSizes.fontSizeBodyM,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 36,
              width: 36,
              child: Opacity(
                opacity: isNextDisabled ? 0.5 : 1,
                child: IconButton(
                  onPressed: isNextDisabled
                      ? null
                      : () {
                          _onAction("next");
                        },
                  icon: const UiIcons(
                    TIcons.arrowRight,
                    size: 16,
                    color: TColors.primary,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
