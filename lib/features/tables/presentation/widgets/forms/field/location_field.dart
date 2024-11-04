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
import 'package:table_location_repository/table_location_repository.dart';

class LocationField extends StatefulWidget {
  const LocationField({
    super.key,
    this.initialValue,
  });

  final String? initialValue;

  @override
  State<LocationField> createState() => _LocationFieldState();
}

class _LocationFieldState extends State<LocationField> {
  late List<TableLocationModel> locations = [];
  String? _selectedLocationId;

  Future<void> showCreateLocation(BuildContext context) async {
    if (!context.mounted) return;

    String? newTableLocationId = await showModalBottomSheet(
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
    ) as String?;

    if (newTableLocationId == null) return;

    if (!context.mounted) return;
    context.read<TableMasterLocationCubit>().findAll();

    setState(() {
      _selectedLocationId = newTableLocationId;
    });

    final field = FormBuilder.of(context)?.fields['outletRoomId'];
    field?.didChange(newTableLocationId);
  }

  void _onInit() {
    context.read<TableMasterLocationCubit>().init();
  }

  String? _getInitialValue(List<TableLocationModel> locations) {
    if (widget.initialValue != null) return widget.initialValue;
    if (locations.isEmpty) return null;

    return locations[0].id;
  }

  @override
  void initState() {
    super.initState();
    _onInit();
    _selectedLocationId = _getInitialValue(locations);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TableMasterLocationCubit, TableMasterLocationState>(
      listener: (context, state) {
        if (state is TableMasterLocationLoadSuccess) {
          locations = state.locations;

          if (_selectedLocationId == null && locations.isNotEmpty) {
            setState(() {
              _selectedLocationId = locations[0].id;
            });
          }
        }
      },
      builder: (context, state) => switch (state) {
        TableMasterLocationLoadSuccess(:final locations) =>
          FormBuilderField<String>(
            name: "outletRoomId",
            initialValue: _selectedLocationId,
            validator: FormBuilderValidators.required(
              errorText: ErrorTextStrings.required(name: "Lokasi"),
            ),
            builder: (field) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 8,
                    runSpacing: -4,
                    children: [
                      if (locations.isNotEmpty)
                        ...locations.map((location) {
                          bool selected = field.value == location.id;
                          return InputChip(
                            label: !selected
                                ? TextBodyS(location.name)
                                : TextHeading5(
                                    location.name,
                                    color: TColors.primary,
                                  ),
                            selected: selected,
                            onPressed: () {
                              field.didChange(location.id);
                            },
                          );
                        }),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          height: 33,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              showCreateLocation(context);
                            },
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
                      ),
                    ],
                  ),
                  if (field.hasError)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.only(left: 12),
                      child: TextBodyS(
                        field.errorText ?? "",
                        color: TColors.error,
                      ),
                    ),
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
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;

    FocusScope.of(context).unfocus();
    dynamic value = _formKey.currentState?.value;

    context
        .read<TableMasterLocationCubit>()
        .create(CreateTableLocationDto(name: value["name"]));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TableMasterLocationCubit, TableMasterLocationState>(
      listener: (context, state) {
        if (state is TableMasterLocationActionSuccess) {
          Navigator.pop(context, state.response.id);
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
                  errorText: ErrorTextStrings.required(name: "Nama Lokasi"),
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
                                  child: CircularProgressIndicator(),
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
