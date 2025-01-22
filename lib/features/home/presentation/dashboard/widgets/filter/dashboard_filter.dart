import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/form/date_range_picker.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_filter_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_filter_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DashboardFilter extends StatefulWidget {
  const DashboardFilter({super.key});

  @override
  State<DashboardFilter> createState() => _DashboardFilterState();
}

class _DashboardFilterState extends State<DashboardFilter> {
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

  Future<void> _onPickDateRange(CashierReportFilterState filter) async {
    final today = DateTime.now();
    DateTime from =
        filter.from == null ? today : DateTime.parse(filter.from!).toLocal();
    DateTime to =
        filter.to == null ? today : DateTime.parse(filter.to!).toLocal();

    if (filter.from == null && filter.to == null) {
      final startOfWeek = _startOfWeek(today);
      final endOfWeek = _endOfWeek(today);
      final startOfMonth = DateTime(today.year, today.month, 1);
      final endOfMonth = DateTime(today.year, today.month + 1, 0);

      switch (filter.template) {
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

    context.read<CashierReportFilterCubit>().setFilter(
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

    return BlocBuilder<CashierReportFilterCubit, CashierReportFilterState>(
        builder: (context, state) {
      bool isDateRangeSelected = state.template == null && state.preset != null;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Wrap(
                  spacing: 8.0,
                  children: _templates
                      .where((template) =>
                          !(isMobile && template.value == "CUSTOM"))
                      .map((template) {
                    bool selected = state.template == template.value;
                    return InputChip(
                      label: (selected ||
                              (template.value == "CUSTOM" &&
                                  isDateRangeSelected))
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
                          _onPickDateRange(state);
                        } else {
                          context
                              .read<CashierReportFilterCubit>()
                              .setFilter(template: template.value);
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
                  const EdgeInsets.only(right: 24, left: 8, top: 4, bottom: 4),
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
                    _onPickDateRange(state);
                    // Navigator.pushNamed(context, "/transaction-date");
                  },
                ),
              ),
            ),
          // SizedBox(
          //   height: 32,
          //   width: 32,
          //   child: OutlinedButton(
          //     onPressed: () async {
          //       Navigator.pushNamed(context, "/transaction-date");
          //       // final picked = await showDateRangePicker(
          //       //   context: context,
          //       //   lastDate: DateTime(DateTime.now().year + 1),
          //       //   firstDate: DateTime(DateTime.now().year),
          //       //   builder: (context, child) {
          //       //     return Theme(
          //       //       data: TAppTheme.lightTheme.copyWith(
          //       //         primaryColor: TColors.primary,
          //       //         // scaffoldBackgroundColor: TColors.errorMedium,
          //       //         dividerColor: TColors.error,
          //       //         colorScheme: TAppTheme.lightTheme.colorScheme.copyWith(
          //       //           primary: TColors.primary,
          //       //           onSecondary: TColors.error,
          //       //           secondaryContainer: TColors.highlightLightest,
          //       //         ),
          //       //       ),
          //       //       child: child!,
          //       //     );
          //       //   },
          //       // );
          //     },
          //     style: const ButtonStyle(
          //       padding: WidgetStatePropertyAll(
          //         EdgeInsets.all(0),
          //       ),
          //       side: WidgetStatePropertyAll(
          //         BorderSide(
          //           color: TColors.neutralLightDark,
          //           width: 0.5,
          //         ),
          //       ),
          //       shape: WidgetStatePropertyAll(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(
          //               12.0,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     child: const UiIcons(
          //       TIcons.calendar,
          //       height: 16,
          //       width: 16,
          //     ),
          //   ),
          // ),
        ],
      );
    });
  }
}
