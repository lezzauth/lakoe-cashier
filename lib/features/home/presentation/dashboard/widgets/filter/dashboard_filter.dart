import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/theme/theme.dart';

class DashboardFilter extends StatefulWidget {
  const DashboardFilter({super.key});

  @override
  State<DashboardFilter> createState() => _DashboardFilterState();
}

class _DashboardFilterState extends State<DashboardFilter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            spacing: 8.0,
            children: [
              InputChip(
                label: const Text("Hari ini"),
                onPressed: () {},
              ),
              InputChip(
                label: const Text("Minggu ini"),
                onPressed: () {},
              ),
              InputChip(
                label: const Text("Bulan ini"),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 32,
            width: 32,
            child: OutlinedButton(
              onPressed: () async {
                Navigator.pushNamed(context, "/home/transaction-date");
                // final picked = await showDateRangePicker(
                //   context: context,
                //   lastDate: DateTime(DateTime.now().year + 1),
                //   firstDate: DateTime(DateTime.now().year),
                //   builder: (context, child) {
                //     return Theme(
                //       data: TAppTheme.lightTheme.copyWith(
                //         primaryColor: TColors.primary,
                //         // scaffoldBackgroundColor: TColors.errorMedium,
                //         dividerColor: TColors.error,
                //         colorScheme: TAppTheme.lightTheme.colorScheme.copyWith(
                //           primary: TColors.primary,
                //           onSecondary: TColors.error,
                //           secondaryContainer: TColors.highlightLightest,
                //         ),
                //       ),
                //       child: child!,
                //     );
                //   },
                // );
              },
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(0),
                ),
                side: WidgetStatePropertyAll(
                  BorderSide(
                    color: TColors.neutralLightDark,
                    width: 0.5,
                  ),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12.0,
                      ),
                    ),
                  ),
                ),
              ),
              child: const UiIcons(
                TIcons.calendar,
                height: 16,
                width: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
