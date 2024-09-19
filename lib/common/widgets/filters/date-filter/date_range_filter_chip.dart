import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sales_cashier/common/widgets/form/date_range_picker.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class DateRangeFilterChip extends StatefulWidget {
  const DateRangeFilterChip({
    super.key,
    this.from,
    this.to,
    required this.onChanged,
  });

  final String? from;
  final String? to;
  final Function(DateTime? from, DateTime? to) onChanged;

  @override
  State<DateRangeFilterChip> createState() => _DateRangeFilterChipState();
}

class _DateRangeFilterChipState extends State<DateRangeFilterChip> {
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

    widget.onChanged(from, to);
  }

  String _display() {
    if (widget.from == null || widget.to == null) return "Semua Tanggal";

    DateTime parsedFrom = DateTime.parse(widget.from!).toLocal();
    DateTime parsedTo = DateTime.parse(widget.to!).toLocal();

    String formattedFrom =
        DateFormat("dd MMM yyyy", "id_ID").format(parsedFrom);
    String formattedTo = DateFormat("dd MMM yyyy", "id_ID").format(parsedTo);

    return "$formattedFrom - $formattedTo";
  }

  @override
  Widget build(BuildContext context) {
    bool isNotEmpty = widget.to != null && widget.from != null;

    return FilterChip(
      onSelected: (value) {
        _onPickDateRange();
      },
      onDeleted: isNotEmpty
          ? () {
              widget.onChanged(null, null);
            }
          : null,
      deleteIconColor: TColors.neutralDarkLightest,
      clipBehavior: Clip.antiAlias,
      label: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextBodyM(_display()),
          if (!isNotEmpty) ...[
            const SizedBox(width: 8),
            const UiIcons(
              TIcons.arrowDown,
              height: 12,
              width: 12,
              color: TColors.neutralDarkLightest,
            ),
          ]
        ],
      ),
    );
  }
}
