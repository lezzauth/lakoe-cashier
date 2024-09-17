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
  String _getFormattedDateBasedOnFilter() {
    DateTime now = DateTime.now();

    if (widget.from != null && widget.to != null) {
      DateTime parsedFrom = DateTime.parse(widget.from!).toLocal();
      DateTime parsedTo = DateTime.parse(widget.to!).toLocal();

      String formattedFrom =
          DateFormat("dd MMM yyyy", "id_ID").format(parsedFrom);
      String formattedTo = DateFormat("dd MMM yyyy", "id_ID").format(parsedTo);

      if (widget.preset == "TODAY") {
        return DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(parsedFrom);
      }
      if (widget.preset == "THISMONTH") {
        return DateFormat("MMMM yyyy", "id_ID").format(parsedFrom);
      }

      return "$formattedFrom - $formattedTo";
    }

    if (widget.template == "TODAY") {
      return DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(now);
    }

    if (widget.template == "THISWEEK") {
      // Get the current weekday (1 is Monday, 7 is Sunday)
      List<DateTime> thisWeek = THelper.getStartEndWeek(now);
      DateTime startOfWeek = thisWeek.elementAt(0);
      DateTime endOfWeek = thisWeek.elementAt(1);

      String formattedStartOfWeek =
          DateFormat("dd MMM yyyy").format(startOfWeek);
      String formattedEndOfWeek =
          DateFormat("dd MMM yyyy", "id_ID").format(endOfWeek);

      return "$formattedStartOfWeek - $formattedEndOfWeek";
    }

    if (widget.template == "THISMONTH") {
      return DateFormat("MMMM yyyy", "id_ID").format(now);
    }

    return "";
  }

  void _onAction(String action) {
    DateTime now = DateTime.now().toUtc();

    DateTime? from = widget.from == null ? null : DateTime.parse(widget.from!);
    DateTime? to = widget.to == null ? null : DateTime.parse(widget.to!);

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

    from = fromTo.elementAt(0);
    to = fromTo.elementAt(1);

    widget.onChanged(template: null, from: from, to: to);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
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
                height: 16,
                width: 16,
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
            child: IconButton(
              onPressed: () {
                _onAction("next");
              },
              icon: const UiIcons(
                TIcons.arrowRight,
                height: 16,
                width: 16,
                color: TColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
