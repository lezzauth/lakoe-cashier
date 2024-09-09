import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_report_filter_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/helpers/helper.dart';

class DashboardDaySelectFilter extends StatefulWidget {
  const DashboardDaySelectFilter({super.key});

  @override
  State<DashboardDaySelectFilter> createState() =>
      _DashboardDaySelectFilterState();
}

class _DashboardDaySelectFilterState extends State<DashboardDaySelectFilter> {
  String _getFormattedDateBasedOnFilter(CashierReportFilterState filter) {
    DateTime now = DateTime.now();

    if (filter.from != null && filter.to != null) {
      DateTime parsedFrom = DateTime.parse(filter.from!).toLocal();
      DateTime parsedTo = DateTime.parse(filter.to!).toLocal();

      String formattedFrom =
          DateFormat("dd MMM yyyy", "id_ID").format(parsedFrom);
      String formattedTo = DateFormat("dd MMM yyyy", "id_ID").format(parsedTo);

      if (filter.preset == "TODAY") {
        return DateFormat("EEEE, dd MMM yyyy", "id_ID").format(parsedFrom);
      }
      if (filter.preset == "THISMONTH") {
        return DateFormat("MMMM yyyy", "id_ID").format(parsedFrom);
      }

      return "$formattedFrom - $formattedTo";
    }

    if (filter.template == "TODAY") {
      return DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(now);
    }

    if (filter.template == "THISWEEK") {
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

    if (filter.template == "THISMONTH") {
      return DateFormat("MMMM yyyy", "id_ID").format(now);
    }

    return "";
  }

  void _onAction(CashierReportFilterState filter, String action) {
    DateTime now = DateTime.now().toUtc();

    DateTime? from = filter.from == null ? null : DateTime.parse(filter.from!);
    DateTime? to = filter.to == null ? null : DateTime.parse(filter.to!);

    DateTime baseDate = (from ?? now).toLocal();
    DateTime modifiedBaseDate;

    List<DateTime> fromTo = [];

    if (filter.preset == "TODAY") {
      if (action == "next") {
        modifiedBaseDate = baseDate.toLocal().add(const Duration(days: 1));
      } else {
        modifiedBaseDate = baseDate.toLocal().subtract(const Duration(days: 1));
      }

      fromTo = THelper.getStartEndDay(modifiedBaseDate);
    }

    if (filter.preset == "THISWEEK") {
      if (action == "next") {
        modifiedBaseDate = baseDate.toLocal().add(const Duration(days: 7));
      } else {
        modifiedBaseDate = baseDate.toLocal().subtract(const Duration(days: 7));
      }

      fromTo = THelper.getStartEndWeek(modifiedBaseDate);
    }

    if (filter.preset == "THISMONTH") {
      if (action == "next") {
        modifiedBaseDate = THelper.addOrSubtractMonth(baseDate, "add");
      } else {
        modifiedBaseDate = THelper.addOrSubtractMonth(baseDate, "subtract");
      }

      fromTo = THelper.getStartEndMonth(modifiedBaseDate);
    }

    from = fromTo.elementAt(0);
    to = fromTo.elementAt(1);

    context.read<CashierReportFilterCubit>().setFilter(
          template: null,
          from: from.toUtc().toIso8601String(),
          to: to.toUtc().toIso8601String(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierReportFilterCubit, CashierReportFilterState>(
      builder: (context, state) {
        return SizedBox(
          height: 36,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  _onAction(state, "previous");
                },
                icon: const UiIcons(
                  TIcons.arrowLeft,
                  height: 16,
                  width: 16,
                  color: TColors.primary,
                ),
              ),
              Text(
                _getFormattedDateBasedOnFilter(state),
                style: GoogleFonts.inter(
                  color: TColors.neutralDarkDarkest,
                  fontSize: TSizes.fontSizeBodyM,
                ),
              ),
              IconButton(
                onPressed: () {
                  _onAction(state, "next");
                },
                icon: const UiIcons(
                  TIcons.arrowRight,
                  height: 16,
                  width: 16,
                  color: TColors.primary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
