import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/filters/date-filter/date_stepper_filter.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_filter_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_report_filter_state.dart';

class DashboardDaySelectFilter extends StatefulWidget {
  const DashboardDaySelectFilter({super.key});

  @override
  State<DashboardDaySelectFilter> createState() =>
      _DashboardDaySelectFilterState();
}

class _DashboardDaySelectFilterState extends State<DashboardDaySelectFilter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierReportFilterCubit, CashierReportFilterState>(
      builder: (context, state) {
        return DateStepperFilter(
          duration: state.duration,
          from: state.from,
          preset: state.preset,
          template: state.template,
          to: state.to,
          onChanged: ({from, template, to}) {
            context.read<CashierReportFilterCubit>().setFilter(
                  template: template,
                  from: from,
                  to: to,
                );
          },
        );
      },
    );
  }
}
