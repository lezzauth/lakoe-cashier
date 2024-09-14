import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_master/charge_master_cubit.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_master/charge_master_state.dart';
import 'package:point_of_sales_cashier/features/charges/data/models.dart';
import 'package:point_of_sales_cashier/features/charges/presentation/widgets/form/field/other_charge_field.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ChargeForm extends StatefulWidget {
  const ChargeForm({super.key});

  @override
  State<ChargeForm> createState() => _ChargeFormState();
}

class _ChargeFormState extends State<ChargeForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  int _chargeCount = 0;
  final List<OtherChargeField> charges = [];

  bool _isFormValid = false;

  Future<void> _onSubmit() async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;
    ChargeMasterState states = context.read<ChargeMasterCubit>().state;
    if (states is! ChargeMasterLoadSuccess) return;

    dynamic value = _formKey.currentState?.value;

    List<ChargeField> newCharges = [];
    List<String> removedChargeIds = [];
    List<ChargeField> updatedCharges = [];

    for (var charge in charges) {
      final name = _formKey.currentState?.fields['name_${charge.id}']?.value;
      final value = _formKey.currentState?.fields['value_${charge.id}']?.value;
      final unit = _formKey.currentState?.fields['unit_${charge.id}']?.value;

      if (charge.id.startsWith("NEW_CHARGE")) {
        newCharges.add(
            ChargeField(id: charge.id, name: name, value: value, unit: unit));
        continue;
      }

      updatedCharges.add(
          ChargeField(id: charge.id, name: name, value: value, unit: unit));
    }

    List<String> updatedChargeIds = updatedCharges.map((e) => e.id).toList();

    removedChargeIds = states.charges
        .whereNot((e) =>
            updatedChargeIds.contains(e.id) || e.name == "Service Charge")
        .map((e) => e.id)
        .toList();

    final serviceCharge =
        states.charges.firstWhereOrNull((e) => e.name == "Service Charge");
    if (serviceCharge != null) {
      if (value["isServiceChargeActive"] == true) {
        updatedCharges.add(
          ChargeField(
            id: serviceCharge.id,
            name: serviceCharge.name,
            value: value["value"],
            unit: "percentage",
          ),
        );
      } else {
        removedChargeIds.add(serviceCharge.id);
      }
    } else {
      newCharges.add(ChargeField(
        id: "serviceCharge",
        name: "Service Charge",
        value: value["value"],
        unit: "percentage",
      ));
    }

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    context.read<ChargeMasterCubit>().save(
          ownerId: authState.profile.id,
          newCharges: newCharges,
          updatedCharges: updatedCharges,
          removedIds: removedChargeIds,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChargeMasterCubit, ChargeMasterState>(
      listener: (context, state) {
        if (state is ChargeMasterLoadSuccess) {
          final serviceCharge = state.charges
              .singleWhereOrNull((charge) => charge.name == "Service Charge");
          if (serviceCharge != null) {
            _formKey.currentState?.fields["isServiceChargeActive"]
                ?.didChange(true);
            _formKey.currentState?.fields["value"]
                ?.didChange(serviceCharge.value.toString());
          }

          final otherCharges =
              state.charges.where((charge) => charge.name != "Service Charge");
          if (otherCharges.isNotEmpty) {
            for (var charge in otherCharges) {
              setState(() {
                final key = ValueKey(charge.id);

                charges.add(
                  OtherChargeField(
                    id: charge.id,
                    key: key,
                    initialValue: {
                      "name": charge.name.toString(),
                      "value": charge.value.toString(),
                      "unit":
                          charge.isPrecentage == true ? "percentage" : "static"
                    },
                    onDelete: () {
                      setState(() {
                        charges.removeWhere((e) => e.key == key);
                      });
                    },
                  ),
                );
              });
            }
          }
        }

        if (state is ChargeMasterActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      child: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: () {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            _isFormValid = _formKey.currentState?.isValid ?? false;
            setState(() {});
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: TColors.neutralLightLight,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            width: 1,
                            color: TColors.neutralLightMedium,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: const TextHeading4(
                                      "Service Charge",
                                      color: TColors.neutralDarkDarkest,
                                    ),
                                  ),
                                  const TextBodyS(
                                    "Biaya tambahan untuk pelayanan. Biasanya dihitung sebagai persentase dari total tagihan.",
                                    color: TColors.neutralDarkLight,
                                  ),
                                ],
                              ),
                            ),
                            FormBuilderField<bool>(
                              name: "isServiceChargeActive",
                              initialValue: false,
                              builder: (FormFieldState<bool> field) {
                                return SizedBox(
                                  height: 28,
                                  width: 45,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Switch(
                                      value: field.value ?? false,
                                      onChanged: (value) {
                                        field.didChange(value);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FormLabel(
                            "Service Charge",
                            sub: "(Biasanya 5-10%)",
                          ),
                          FormBuilderTextField(
                            name: "value",
                            decoration: const InputDecoration(
                              suffixText: "%",
                              hintText: "Masukan jumlah tarif service charge",
                            ),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}|^\d+\,?\d{0,2}')),
                            ],
                          )
                        ],
                      ),
                    ),
                    if (charges.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            margin: const EdgeInsets.only(bottom: 24),
                            child: const TextHeading5(
                              "BIAYA LAINNYA",
                              color: TColors.neutralDarkLightest,
                            ),
                          ),
                          ...charges,
                        ],
                      ),
                    TextButton(
                      onPressed: () {
                        final newChargeFieldId = "NEW_CHARGE_${_chargeCount++}";
                        final newChargeFieldKey = ValueKey(_chargeCount);
                        setState(() {
                          charges.add(OtherChargeField(
                            id: newChargeFieldId,
                            key: newChargeFieldKey,
                            onDelete: () {
                              setState(() {
                                charges.removeWhere(
                                    (e) => e.key == newChargeFieldKey);
                              });
                            },
                          ));
                        });
                      },
                      child: const TextActionL(
                        "Tambah biaya lainnya",
                        color: TColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<ChargeMasterCubit, ChargeMasterState>(
                builder: (context, state) {
              return Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed:
                      state is! ChargeMasterActionInProgress && _isFormValid
                          ? _onSubmit
                          : null,
                  child: state is ChargeMasterActionInProgress
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: TColors.neutralLightLightest,
                            strokeWidth: 2,
                          ),
                        )
                      : const TextActionL(
                          "Simpan",
                        ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
