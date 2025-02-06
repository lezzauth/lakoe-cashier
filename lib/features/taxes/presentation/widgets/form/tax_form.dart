import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/form/form_label.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_5.dart';
import 'package:lakoe_pos/features/taxes/application/cubit/tax_form.dart/tax_form_cubit.dart';
import 'package:lakoe_pos/features/taxes/application/cubit/tax_form.dart/tax_form_state.dart';
import 'package:lakoe_pos/features/taxes/application/cubit/tax_master/tax_master_cubit.dart';
import 'package:lakoe_pos/features/taxes/application/cubit/tax_master/tax_master_state.dart';
import 'package:lakoe_pos/features/taxes/presentation/widgets/form/field/other_tax_field.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';

class TaxForm extends StatefulWidget {
  const TaxForm({super.key, required this.formKey, required this.onSubmitted});

  final GlobalKey<FormBuilderState> formKey;
  final Function() onSubmitted;

  @override
  State<TaxForm> createState() => _TaxFormState();
}

class _TaxFormState extends State<TaxForm> {
  bool _isPB1Active = false;

  @override
  Widget build(BuildContext context) {
    final formKey = widget.formKey;
    return BlocBuilder<TaxFormCubit, TaxFormState>(
        builder: (context, formState) {
      return BlocConsumer<TaxMasterCubit, TaxMasterState>(
        listener: (context, state) {
          if (state is TaxMasterLoadSuccess) {
            final pb1Tax =
                state.taxes.singleWhereOrNull((tax) => tax.name == "PB1");
            if (pb1Tax != null) {
              setState(() {
                _isPB1Active = true;
              });
            }
            final otherTaxes = state.taxes.where((tax) => tax.name != "PB1");
            if (otherTaxes.isNotEmpty) {
              for (var tax in otherTaxes) {
                final taxFieldKey = ValueKey(tax.id);

                context.read<TaxFormCubit>().addTax(
                      OtherTaxField(
                        id: tax.id,
                        key: taxFieldKey,
                        initialValue: {
                          "name": tax.name.toString(),
                          "value": tax.value.toString(),
                        },
                        onDelete: () {
                          context.read<TaxFormCubit>().removeTax(taxFieldKey);
                        },
                      ),
                    );
              }
            }
          }

          if (state is TaxMasterActionSuccess) {
            Navigator.pop(context, true);
          }
        },
        builder: (context, state) {
          Map<String, dynamic> initialValue = const <String, dynamic>{};

          if (state is TaxMasterLoadSuccess) {
            final pb1Tax =
                state.taxes.singleWhereOrNull((tax) => tax.name == "PB1");
            if (pb1Tax != null) {
              initialValue = {
                "isPB1Active": true,
                "value": pb1Tax.value.toString(),
              };
            }
          }

          return switch (state) {
            TaxMasterLoadSuccess() => FormBuilder(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: initialValue,
                onChanged: () {
                  log('onChanged');
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    bool isFormValid = formKey.currentState?.isValid ?? false;
                    _isPB1Active =
                        formKey.currentState?.instantValue["isPB1Active"] ??
                            false;
                    context.read<TaxFormCubit>().setValue(
                        formKey.currentState?.instantValue, isFormValid, true);
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              "Aktifkan PB1",
                                              color: TColors.neutralDarkDarkest,
                                            ),
                                          ),
                                          const TextBodyS(
                                            "Pajak yang dikenakan jika usaha kamu menyediakan makanan/minuman untuk dinikmati di tempat.",
                                            color: TColors.neutralDarkLight,
                                          ),
                                        ],
                                      ),
                                    ),
                                    FormBuilderField<bool>(
                                      name: "isPB1Active",
                                      initialValue:
                                          initialValue["isPB1Active"] ?? false,
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
                                    "Tarif PB1",
                                    sub: "(Maksimal 10%)",
                                  ),
                                  FormBuilderTextField(
                                    name: "value",
                                    decoration: const InputDecoration(
                                      suffixText: "%",
                                      hintText: "Masukan jumlah tarif PB1",
                                    ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(3),
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}|^\d+,?\d{0,2}'),
                                      ),
                                    ],
                                    validator: (value) {
                                      bool isPB1Active = formKey.currentState
                                              ?.fields["isPB1Active"]?.value ??
                                          false;

                                      if (!isPB1Active) return null;

                                      return FormBuilderValidators.compose([
                                        FormBuilderValidators.max(
                                          10,
                                          errorText:
                                              ErrorTextStrings.max(max: 10),
                                        ),
                                      ])(value);
                                    },
                                    enabled: _isPB1Active,
                                  )
                                ],
                              ),
                            ),
                            if (formState.taxes.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    margin: const EdgeInsets.only(bottom: 24),
                                    child: const TextHeading5(
                                      "PAJAK LAINNYA",
                                      color: TColors.neutralDarkLightest,
                                    ),
                                  ),
                                  ...formState.taxes,
                                ],
                              ),
                            TextButton(
                              onPressed: () {
                                final int count = formState.taxCount + 1;
                                final newTaxFieldId = "NEW_TAX_$count";
                                final newTaxFieldKey = ValueKey(count);

                                context.read<TaxFormCubit>().addTax(
                                      OtherTaxField(
                                        id: newTaxFieldId,
                                        key: newTaxFieldKey,
                                        onDelete: () {
                                          context
                                              .read<TaxFormCubit>()
                                              .removeTax(newTaxFieldKey);
                                        },
                                      ),
                                    );
                              },
                              child: const TextActionL(
                                "Tambah pajak lainnya",
                                color: TColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<TaxMasterCubit, TaxMasterState>(
                        builder: (context, state) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: ElevatedButton(
                          onPressed: state is! TaxMasterActionInProgress &&
                                  formState.isFormValid
                              ? widget.onSubmitted
                              : null,
                          child: state is TaxMasterActionInProgress
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
    });
  }
}
