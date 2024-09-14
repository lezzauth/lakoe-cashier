import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_cubit.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';
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
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: TDeviceUtils.getViewInsets(context),
          child: const SingleChildScrollView(
            child: CreateTableLocationForm(),
          ),
        );
      },
    );
    return newTableLocation;
  }

  Future<void> _onInit() async {
    if (!mounted) return;
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    await context
        .read<TableMasterLocationCubit>()
        .findAll(FindAllTableLocationDto(outletId: authState.outletId));
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
                spacing: 8,
                runSpacing: 8,
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
    AuthReady authState = context.read<AuthCubit>().state as AuthReady;

    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;

    dynamic value = _formKey.currentState?.value;

    await context
        .read<TableMasterLocationCubit>()
        .create(CreateTableLocationDto(
          name: value["name"],
          outletId: authState.outletId,
        ));
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    errorText: ErrorTextStrings.required()),
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
