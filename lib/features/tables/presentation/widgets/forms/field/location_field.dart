import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

class LocationField extends StatefulWidget {
  final String? initialValue;

  const LocationField({
    super.key,
    this.initialValue,
  });

  @override
  State<LocationField> createState() => _LocationFieldState();
}

class _LocationFieldState extends State<LocationField> {
  showCreateLocation() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: TDeviceUtils.getViewInsets(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const TextHeading2(
                    "Buat lokasi baru",
                    color: TColors.neutralDarkDarkest,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: FormBuilderTextField(
                    name: "name",
                    decoration:
                        const InputDecoration(hintText: "Contoh: Indoor"),
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
                            onPressed: () {},
                            child: const TextActionL("Simpan"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableMasterLocationCubit, TableMasterLocationState>(
      builder: (context, state) => switch (state) {
        TableMasterLocationLoadSuccess(:final locations) => FormBuilderField(
            name: "outletRoomId",
            initialValue: widget.initialValue ?? locations[0].id,
            builder: (field) {
              return Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                children: [
                  ...locations.map((location) {
                    bool selected = location.id == field.value;
                    return SizedBox(
                      height: 32,
                      child: ChoiceChip(
                        label: selected
                            ? TextHeading5(
                                location.name,
                                color: TColors.primary,
                              )
                            : TextBodyS(location.name),
                        selected: selected,
                        onSelected: (value) {
                          field.didChange(location.id);
                        },
                      ),
                    );
                  }),
                  SizedBox(
                    height: 32,
                    child: OutlinedButton.icon(
                      onPressed: showCreateLocation,
                      label: const TextActionM(
                        "Buat Baru",
                        color: TColors.primary,
                      ),
                      style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 14.0),
                          ),
                          side: WidgetStatePropertyAll(BorderSide(
                            width: 1,
                            color: TColors.primary,
                          ))),
                      icon: const UiIcons(
                        TIcons.add,
                        height: 12,
                        width: 12,
                        color: TColors.primary,
                      ),
                    ),
                  )
                ],
              );
            },
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
    );
  }
}
