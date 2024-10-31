import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/shimmer/chips_shimmer.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';
import 'package:table_location_repository/table_location_repository.dart';

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
  Future<TableLocationModel?> showCreateLocation() async {
    TableLocationModel? newTableLocation =
        await showModalBottomSheet<TableLocationModel>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: Container(
            padding: TDeviceUtils.getViewInsets(context),
            child: const SingleChildScrollView(
              child: CreateTableLocationForm(),
            ),
          ),
        );
      },
    );
    return newTableLocation;
  }

  Future<void> _onInit() async {
    if (!mounted) return;

    await context
        .read<TableMasterLocationCubit>()
        .findAll(FindAllTableLocationDto());
  }

  @override
  void initState() {
    super.initState();

    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TableMasterLocationCubit, TableMasterLocationState>(
      listener: (context, state) {
        if (state is TableMasterLocationActionSuccess) {
          _onInit();
        }
      },
      builder: (context, state) => switch (state) {
        TableMasterLocationLoadSuccess(:final locations) => FormBuilderField(
            name: "outletRoomId",
            initialValue: widget.initialValue ?? locations[0].id,
            builder: (field) {
              return Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...locations.map((location) {
                    bool selected = location.id == field.value;
                    return SizedBox(
                      // height: 32,
                      child: ChoiceChip(
                        label: selected
                            ? TextHeading5(
                                TFormatter.capitalizeEachWord(location.name),
                                color: TColors.primary,
                              )
                            : TextBodyS(
                                TFormatter.capitalizeEachWord(location.name),
                              ),
                        selected: selected,
                        onSelected: (value) {
                          field.didChange(location.id);
                        },
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 33,
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
                          size: 12,
                          color: TColors.primary,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        TableMasterLocationLoadFailure() => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: null,
            child: ChipsShimmer(),
          ),
        _ => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: null,
            child: ChipsShimmer(),
          ),
      },
    );
  }
}

class CreateTableLocationForm extends StatefulWidget {
  const CreateTableLocationForm({super.key});

  @override
  State<CreateTableLocationForm> createState() =>
      _CreateTableLocationFormState();
}

class _CreateTableLocationFormState extends State<CreateTableLocationForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();

    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;

    dynamic value = _formKey.currentState?.value;

    await context
        .read<TableMasterLocationCubit>()
        .create(CreateTableLocationDto(name: value["name"]));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TableMasterLocationCubit, TableMasterLocationState>(
      listener: (context, state) {
        if (state is TableMasterLocationActionSuccess) {
          Navigator.pop(context, state.response);
        }
      },
      child: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: const TextHeading2(
                "Buat lokasi baru",
                color: TColors.neutralDarkDarkest,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: FormBuilderTextField(
                name: "name",
                decoration: const InputDecoration(hintText: "Contoh: Indoor"),
                validator: FormBuilderValidators.required(
                  errorText: ErrorTextStrings.required(),
                ),
                textCapitalization: TextCapitalization.words,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: BlocBuilder<TableMasterLocationCubit,
                          TableMasterLocationState>(builder: (context, state) {
                        return ElevatedButton(
                          onPressed:
                              state is TableMasterLocationActionInProgress
                                  ? null
                                  : _onSubmit,
                          child: state is TableMasterLocationActionInProgress
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1.2,
                                  ),
                                )
                              : const TextActionL("Simpan"),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
