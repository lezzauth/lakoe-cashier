import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/form/form_label.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_form/charge_form_cubit.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_form/charge_form_state.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_master/charge_master_cubit.dart';
import 'package:point_of_sales_cashier/features/charges/application/cubit/charge_master/charge_master_state.dart';
import 'package:point_of_sales_cashier/features/charges/presentation/widgets/form/field/other_charge_field.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class ChargeForm extends StatefulWidget {
  const ChargeForm(
      {super.key, required this.formKey, required this.onSubmitted});

  final GlobalKey<FormBuilderState> formKey;
  final Function() onSubmitted;

  @override
  State<ChargeForm> createState() => _ChargeFormState();
}

class _ChargeFormState extends State<ChargeForm> {
  bool _isServiceChargeActive = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = widget.formKey;

    return BlocBuilder<ChargeFormCubit, ChargeFormState>(
      builder: (context, formState) {
        return BlocConsumer<ChargeMasterCubit, ChargeMasterState>(
          listener: (context, state) {
            if (state is ChargeMasterLoadSuccess) {
              final serviceCharge = state.charges.singleWhereOrNull(
                  (charge) => charge.name == "Service Charge");
              if (serviceCharge != null) {
                setState(() {
                  _isServiceChargeActive = true;
                });
              }

              final otherCharges = state.charges
                  .where((charge) => charge.name != "Service Charge");
              if (otherCharges.isNotEmpty) {
                for (var charge in otherCharges) {
                  final key = ValueKey(charge.id);

                  context.read<ChargeFormCubit>().addCharge(
                        OtherChargeField(
                          id: charge.id,
                          key: key,
                          initialValue: {
                            "name": charge.name.toString(),
                            "value": charge.value.toString(),
                            "unit": charge.isPercentage == true
                                ? "percentage"
                                : "static"
                          },
                          onDelete: () {
                            context.read<ChargeFormCubit>().removeCharge(key);
                          },
                        ),
                      );
                }
              }
            }

            if (state is ChargeMasterActionSuccess) {
              Navigator.pop(context, true);
            }
          },
          builder: (context, state) {
            Map<String, dynamic> initialValue = const <String, dynamic>{};

            if (state is ChargeMasterLoadSuccess) {
              final serviceCharge = state.charges.singleWhereOrNull(
                  (charge) => charge.name == "Service Charge");

              if (serviceCharge != null) {
                initialValue = {
                  "isServiceChargeActive": true,
                  "value": serviceCharge.value.toString(),
                };
              }
            }

            return switch (state) {
              ChargeMasterLoadSuccess() => FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: initialValue,
                  onChanged: () {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      bool isFormValid =
                          _formKey.currentState?.isValid ?? false;
                      _isServiceChargeActive = _formKey.currentState
                              ?.instantValue["isServiceChargeActive"] ??
                          false;

                      context.read<ChargeFormCubit>().setValue(
                            _formKey.currentState?.instantValue,
                            isFormValid,
                            true,
                          );
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: const TextHeading4(
                                                "Service Charge",
                                                color:
                                                    TColors.neutralDarkDarkest,
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
                                        initialValue: initialValue[
                                                "isServiceChargeActive"] ??
                                            false,
                                        builder: (FormFieldState<bool> field) {
                                          return FittedBox(
                                            fit: BoxFit.cover,
                                            child: Switch(
                                              value: field.value ?? false,
                                              onChanged: (value) {
                                                field.didChange(value);
                                              },
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
                                        hintText:
                                            "Masukan jumlah tarif service charge",
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp(
                                            r'^\d+\.?\d{0,2}|^\d+\,?\d{0,2}')),
                                      ],
                                      validator: (value) {
                                        bool isServiceChargeActive = _formKey
                                                .currentState
                                                ?.fields[
                                                    "isServiceChargeActive"]
                                                ?.value ??
                                            false;

                                        if (!isServiceChargeActive) return null;

                                        return FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                            errorText:
                                                ErrorTextStrings.required(),
                                          ),
                                        ])(value);
                                      },
                                      enabled: _isServiceChargeActive,
                                    )
                                  ],
                                ),
                              ),
                              if (formState.charges.isNotEmpty)
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 20),
                                      margin: const EdgeInsets.only(bottom: 24),
                                      child: const TextHeading5(
                                        "BIAYA LAINNYA",
                                        color: TColors.neutralDarkLightest,
                                      ),
                                    ),
                                    ...formState.charges,
                                  ],
                                ),
                              TextButton(
                                onPressed: () {
                                  final int count = formState.chargeCount + 1;

                                  final newChargeFieldId = "NEW_CHARGE_$count";
                                  final newChargeFieldKey = ValueKey(count);
                                  context.read<ChargeFormCubit>().addCharge(
                                        OtherChargeField(
                                          id: newChargeFieldId,
                                          key: newChargeFieldKey,
                                          onDelete: () {
                                            context
                                                .read<ChargeFormCubit>()
                                                .removeCharge(
                                                    newChargeFieldKey);
                                          },
                                        ),
                                      );
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ElevatedButton(
                            onPressed: state is! ChargeMasterActionInProgress &&
                                    formState.isFormValid
                                ? widget.onSubmitted
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
              _ => const Center(
                  child: CircularProgressIndicator(),
                ),
            };
          },
        );
      },
    );
  }
}
