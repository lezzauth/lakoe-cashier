import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class TableLocationFilter extends StatefulWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const TableLocationFilter({
    super.key,
    this.value,
    required this.onChanged,
  });

  @override
  State<TableLocationFilter> createState() => _TableLocationFilterState();
}

class _TableLocationFilterState extends State<TableLocationFilter> {
  @override
  Widget build(BuildContext context) {
    bool isSelectAll = widget.value == null;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 8.0,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ChoiceChip(
            label: isSelectAll
                ? const TextHeading5(
                    "Semua",
                    color: TColors.primary,
                  )
                : const TextBodyS("Semua"),
            selected: isSelectAll,
            onSelected: (value) {
              widget.onChanged(null);
            },
          ),
          BlocBuilder<TableMasterLocationCubit, TableMasterLocationState>(
            builder: (context, state) => switch (state) {
              TableMasterLocationLoadSuccess(:final locations) => Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  children: locations.map((location) {
                    bool selected = location.id == widget.value;
                    return ChoiceChip(
                      label: selected
                          ? TextHeading5(
                              location.name,
                              color: TColors.primary,
                            )
                          : TextBodyS(location.name),
                      selected: selected,
                      onSelected: (value) {
                        widget.onChanged(location.id);
                      },
                    );
                  }).toList(),
                ),
              TableMasterLocationLoadFailure() => const SizedBox(
                  height: 16,
                  width: 16,
                  child: UiIcons(
                    TIcons.warning,
                    height: 16,
                    width: 16,
                    color: TColors.error,
                  ),
                ),
              _ => const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
            },
          ),
        ],
      ),
    );
  }
}
