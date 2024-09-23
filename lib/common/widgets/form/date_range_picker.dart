import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sales_cashier/common/widgets/form/date_picker.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({
    super.key,
    this.from,
    this.to,
    this.hideLabel = false,
    this.onSubmit,
  });

  final DateTime? from;
  final DateTime? to;
  final bool hideLabel;
  final Function({DateTime? from, DateTime? to})? onSubmit;

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? from;
  DateTime? to;
  final DateTime now = DateTime.now();

  Future<void> _onSubmit() async {
    if (from == null || to == null) return;

    if (widget.onSubmit != null) {
      widget.onSubmit!(from: from, to: to);
      return;
    }

    Navigator.pop(context, [
      DateTime(from!.year, from!.month, from!.day),
      DateTime(to!.year, to!.month, to!.day, 23, 59, 59, 999)
    ]);
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      from = widget.from;
      to = widget.to;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = from != null && to != null;

    log('widget.to: ${widget.to} | widget.from: ${widget.from}');

    DateTime maximumDate =
        DateTime(now.year, now.month, now.day, 23, 59, 59, 999);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!widget.hideLabel)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: const TextHeading2("Pilih tanggal"),
          ),
        Ink(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Picker(
                label: "Mulai dari",
                onChanged: (value) {
                  setState(() {
                    from = value;
                  });
                },
                value: from,
                maximumDate: from == null
                    ? null
                    : from!.isAfter(maximumDate)
                        ? from
                        : maximumDate,
              ),
              const SizedBox(width: 12),
              Picker(
                label: "Sampai",
                onChanged: (value) {
                  setState(() {
                    to = value;
                  });
                },
                value: to,
                minimumDate: from,
                maximumDate: to == null
                    ? null
                    : to!.isAfter(maximumDate)
                        ? to
                        : maximumDate,
                enabled: from != null,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isFormValid ? _onSubmit : null,
                    child: const TextActionL("Pasang"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Picker extends StatefulWidget {
  const Picker({
    super.key,
    required this.label,
    required this.onChanged,
    this.value,
    this.initialDateTime,
    this.maximumDate,
    this.minimumDate,
    this.enabled = true,
  });

  final String label;
  final ValueChanged<DateTime> onChanged;
  final DateTime? value;
  final DateTime? initialDateTime;
  final DateTime? maximumDate;
  final DateTime? minimumDate;
  final bool enabled;

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  Future<void> _onPick() async {
    DateTime? date = await showModalBottomSheet<DateTime?>(
      context: context,
      builder: (context) {
        return CustomBottomsheet(
          child: DatePicker(
            title: widget.label,
            initialDateTime: widget.initialDateTime ?? widget.value,
            maximumDate: widget.maximumDate,
            minimumDate: widget.minimumDate,
            onChanged: (value) {
              Navigator.pop(context, value);
            },
          ),
        );
      },
    );

    if (date == null) return;
    widget.onChanged(date);
  }

  String _getDisplay() {
    DateTime? display = widget.value;
    display ??= widget.initialDateTime;

    if (display == null) return "-";

    return DateFormat("dd MMM yyyy", "id_ID").format(display);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: TextHeading5(widget.label),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: widget.enabled ? _onPick : null,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: TColors.neutralLightDarkest,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: TextBodyM(
                _getDisplay(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
