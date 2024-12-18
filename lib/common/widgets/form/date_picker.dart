import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.title,
    required this.onChanged,
    this.initialDateTime,
    this.maximumDate,
    this.minimumDate,
  });

  final DateTime? initialDateTime;
  final DateTime? maximumDate;
  final DateTime? minimumDate;
  final ValueChanged<DateTime> onChanged;

  final String title;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: const Locale("id"),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextHeading2(widget.title),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 200,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: GoogleFonts.inter(
                      fontSize: 16,
                      color: TColors.neutralDarkDarkest,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  dateOrder: DatePickerDateOrder.dmy,
                  onDateTimeChanged: (value) {
                    setState(() {
                      selectedDate = value;
                    });
                  },
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: widget.initialDateTime,
                  maximumDate: widget.maximumDate,
                  minimumDate: widget.minimumDate,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onChanged(
                        selectedDate ??
                            widget.initialDateTime ??
                            DateTime.now(),
                      );
                    },
                    child: TextActionL("Pilih"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
