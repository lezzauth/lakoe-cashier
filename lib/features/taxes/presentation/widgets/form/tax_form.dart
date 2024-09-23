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
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_cubit.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:point_of_sales_cashier/features/taxes/application/cubit/tax_master/tax_master_cubit.dart';
import 'package:point_of_sales_cashier/features/taxes/application/cubit/tax_master/tax_master_state.dart';
import 'package:point_of_sales_cashier/features/taxes/data/models.dart';
import 'package:point_of_sales_cashier/features/taxes/presentation/widgets/form/field/other_tax_field.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class TaxForm extends StatefulWidget {
  const TaxForm({super.key});

  @override
  State<TaxForm> createState() => _TaxFormState();
}

class _TaxFormState extends State<TaxForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  int _taxCount = 0;
  final List<OtherTaxField> taxes = [];

  bool _isFormValid = false;
  bool _isPB1Active = false;

  Future<void> _onSubmit() async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) return;
    TaxMasterState states = context.read<TaxMasterCubit>().state;
    if (states is! TaxMasterLoadSuccess) return;

    dynamic value = _formKey.currentState?.value;

    List<TaxField> newTaxes = [];
    List<String> removedTaxIds = [];
    List<TaxField> updatedTaxes = [];

    for (var tax in taxes) {
      final name = _formKey.currentState?.fields['name_${tax.id}']?.value;
      final value = _formKey.currentState?.fields['value_${tax.id}']?.value;

      if (tax.id.startsWith("NEW_TAX")) {
        newTaxes.add(TaxField(id: tax.id, name: name, value: value));
        continue;
      }

      updatedTaxes.add(TaxField(id: tax.id, name: name, value: value));
    }

    List<String> updatedTaxIds = updatedTaxes.map((e) => e.id).toList();

    removedTaxIds = states.taxes
        .whereNot((e) => updatedTaxIds.contains(e.id) || e.name == "PB1")
        .map((e) => e.id)
        .toList();

    final pb1Tax = states.taxes.firstWhereOrNull((e) => e.name == "PB1");
    if (pb1Tax != null) {
      if (value["isPB1Active"] == true) {
        updatedTaxes.add(
            TaxField(id: pb1Tax.id, name: pb1Tax.name, value: value["value"]));
      } else {
        removedTaxIds.add(pb1Tax.id);
      }
    } else {
      if (value["isPB1Active"] == true) {
        newTaxes.add(TaxField(id: "pb1", name: "PB1", value: value["value"]));
      }
    }

    AuthReady authState = context.read<AuthCubit>().state as AuthReady;
    context.read<TaxMasterCubit>().save(
          ownerId: authState.profile.id,
          newTaxes: newTaxes,
          updatedTaxes: updatedTaxes,
          removedIds: removedTaxIds,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaxMasterCubit, TaxMasterState>(
      listener: (context, state) {
        if (state is TaxMasterLoadSuccess) {
          final pb1Tax =
              state.taxes.singleWhereOrNull((tax) => tax.name == "PB1");
          if (pb1Tax != null) {
            _formKey.currentState?.fields["isPB1Active"]?.didChange(true);
            _formKey.currentState?.fields["value"]
                ?.didChange(pb1Tax.value.toString());
            setState(() {
              _isPB1Active = true;
            });
          }
          final otherTaxes = state.taxes.where((tax) => tax.name != "PB1");
          if (otherTaxes.isNotEmpty) {
            for (var tax in otherTaxes) {
              setState(() {
                final taxFieldKey = ValueKey(tax.id);

                taxes.add(OtherTaxField(
                  id: tax.id,
                  key: taxFieldKey,
                  initialValue: {
                    "name": tax.name.toString(),
                    "value": tax.value.toString(),
                  },
                  onDelete: () {
                    setState(() {
                      taxes.removeWhere((e) => e.key == taxFieldKey);
                    });
                  },
                ));
              });
            }
          }
        }

        if (state is TaxMasterActionSuccess) {
          Navigator.pop(context, true);
        }
      },
      child: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: () {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            _isFormValid = _formKey.currentState?.isValid ?? false;
            _isPB1Active =
                _formKey.currentState?.instantValue["isPB1Active"] ?? false;

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
                                      "Aktifkan PB1",
                                      color: TColors.neutralDarkDarkest,
                                    ),
                                  ),
                                  const TextBodyS(
                                    "Pajak yang dikenakan jika usaha Anda menyediakan makanan/minuman untuk dinikmati di tempat.",
                                    color: TColors.neutralDarkLight,
                                  ),
                                ],
                              ),
                            ),
                            FormBuilderField<bool>(
                              name: "isPB1Active",
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
                            "Tarif PB1",
                            sub: "(maksimal 10%)",
                          ),
                          FormBuilderTextField(
                            name: "value",
                            decoration: const InputDecoration(
                              suffixText: "%",
                              hintText: "Masukan jumlah tarif PB1",
                            ),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}|^\d+\,?\d{0,2}')),
                            ],
                            validator: (value) {
                              bool isPB1Active = _formKey.currentState
                                      ?.fields["isPB1Active"]?.value ??
                                  false;

                              if (!isPB1Active) return null;

                              return FormBuilderValidators.compose([
                                FormBuilderValidators.max(
                                  10,
                                  errorText: ErrorTextStrings.max(max: 10),
                                ),
                              ])(value);
                            },
                            enabled: _isPB1Active,
                          )
                        ],
                      ),
                    ),
                    if (taxes.isNotEmpty)
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
                          ...taxes,
                        ],
                      ),
                    TextButton(
                      onPressed: () {
                        final newTaxFieldId = "NEW_TAX_${_taxCount++}";
                        final newTaxFieldKey = ValueKey(_taxCount);
                        setState(() {
                          taxes.add(OtherTaxField(
                            id: newTaxFieldId,
                            key: newTaxFieldKey,
                            onDelete: () {
                              setState(() {
                                taxes.removeWhere(
                                    (e) => e.key == newTaxFieldKey);
                              });
                            },
                          ));
                        });
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ElevatedButton(
                  onPressed: state is! TaxMasterActionInProgress && _isFormValid
                      ? _onSubmit
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
    );
  }
}
