import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/data/models.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_filter_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierReportFilterCubit, CashierReportFilterState>(
        builder: (context, state) {
      bool isDateRangeSelected = state.template == null && state.preset != null;

      return SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              spacing: 8.0,
              children: _templates.map((template) {
                bool selected = state.template == template.value;
                return InputChip(
                  label: selected
                      ? TextHeading5(
                          template.label,
                          color: TColors.primary,
                        )
                      : TextBodyS(template.label),
                  selected: selected,
                  onSelected: (value) {
                    context
                        .read<CashierReportFilterCubit>()
                        .setFilter(template: template.value);
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 32,
              width: 32,
              child: InputChip(
                padding: EdgeInsets.zero,
                label: Container(
                  height: 16,
                  width: 16,
                  alignment: Alignment.center,
                  child: UiIcons(
                    TIcons.calendar,
                    height: 16,
                    width: 16,
                    color: isDateRangeSelected
                        ? TColors.primary
                        : TColors.neutralDarkDarkest,
                  ),
                ),
                selected: isDateRangeSelected,
                onSelected: (value) {
                  Navigator.pushNamed(context, "/cashier/transaction-date");
                },
              ),
            ),
            // SizedBox(
            //   height: 32,
            //   width: 32,
            //   child: OutlinedButton(
            //     onPressed: () async {
            //       Navigator.pushNamed(context, "/cashier/transaction-date");
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
        ),
      );
    });
  }
}
