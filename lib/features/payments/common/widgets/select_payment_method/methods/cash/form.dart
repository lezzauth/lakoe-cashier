import 'dart:developer';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/payments/data/models/payment_method_return_model.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class CashPaymentForm extends StatefulWidget {
  final int amount;
  const CashPaymentForm({super.key, this.amount = 0});

  @override
  State<CashPaymentForm> createState() => _CashPaymentFormState();
}

class _CashPaymentFormState extends State<CashPaymentForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<int> _presets = [20000, 30000, 50000];

  int? _selectedPreset;

  int _paidAmount = 0;

  final CurrencyTextInputFormatter _paidAmountFormatter =
      CurrencyTextInputFormatter.currency(
    locale: "id_ID",
    symbol: "Rp",
    decimalDigits: 0,
  );

  int _getPaidAmount() {
    int paidAmount = 0;

    if (_selectedPreset == null) {
      paidAmount = _paidAmount;
    } else {
      paidAmount = _selectedPreset!;
    }

    return paidAmount;
  }

  int _getChange() {
    int change = _getPaidAmount() - widget.amount;
    if (change <= 0) return 0;

    return change;
  }

  void _onSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      // dynamic value = _formKey.currentState?.value;

      Navigator.pop(
        context,
        CashPaymentMethodReturn(
          paidAmount: _getPaidAmount(),
          change: _getChange(),
        ),
      );
    } else {
      const snackBar = SnackBar(
        content: Text('Validation failed'),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      onChanged: () {
        setState(() {
          _paidAmount = _paidAmountFormatter.getUnformattedValue().toInt();
          _selectedPreset = null;
        });
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: FormBuilderTextField(
                    name: "paidAmount",
                    keyboardType: TextInputType.number,
                    inputFormatters: [_paidAmountFormatter],
                    decoration: InputDecoration(
                      hintText: 'Rp Uang yang diterima',
                      suffixIcon: _paidAmount > 0
                          ? IconButton(
                              onPressed: () {
                                _formKey.currentState!.fields["paidAmount"]
                                    ?.reset();
                                setState(() {
                                  _paidAmount = 0;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 22,
                                color: TColors.neutralDarkLightest,
                              ),
                              visualDensity: VisualDensity.compact,
                            )
                          : null,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.transform((value) {
                        return _paidAmountFormatter
                            .getUnformattedValue()
                            .toString();
                      }, FormBuilderValidators.numeric()),
                    ]),
                    valueTransformer: (value) {
                      return _paidAmountFormatter.getUnformattedValue();
                    },
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  children: _presets.map((preset) {
                    bool selected = _selectedPreset == preset;
                    return InputChip(
                      label: !selected
                          ? TextBodyS(
                              TFormatter.formatToRupiah(preset),
                            )
                          : TextHeading5(
                              TFormatter.formatToRupiah(preset),
                              color: TColors.primary,
                            ),
                      selected: selected,
                      onPressed: () {
                        _formKey.currentState!.fields["paidAmount"]?.reset();
                        setState(() {
                          _selectedPreset = preset;
                          _paidAmount = 0;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: TColors.neutralLightLight,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextBodyM("Total Pesanan"),
                          TextHeading4(
                              TFormatter.formatToRupiah(widget.amount)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextBodyM("Uang yang diterima"),
                          TextHeading4(
                              TFormatter.formatToRupiah(_getPaidAmount())),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Separator(
                    color: TColors.neutralLightDark,
                    height: 1,
                    dashWidth: 5.0,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    color: TColors.neutralLightLight,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextHeading3("Kembalian"),
                      TextHeading3(
                        TFormatter.formatToRupiah(_getChange()),
                      ),
                    ],
                  ),
                ),
              ],
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
                      onPressed: _onSubmit,
                      child: const TextActionL("Selesaikan"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
