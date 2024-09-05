import 'dart:async';

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
  final List<int> _presets = [
    500,
    1000,
    2000,
    5000,
    10000,
    20000,
    50000,
    100000
  ];

  int _paidAmount = 0;

  final CurrencyTextInputFormatter _paidAmountFormatter =
      CurrencyTextInputFormatter.currency(
    locale: "id_ID",
    symbol: "Rp",
    decimalDigits: 0,
  );

  int _getPaidAmount() {
    return _paidAmount;
  }

  int _getChange() {
    int change = _getPaidAmount() - widget.amount;
    if (change <= 0) return 0;

    return change;
  }

  bool _showTextAmount = false;
  double _textAmountOpacity = 0.0;
  int _selectedPreset = 0;
  Timer? _debounce;

  void _onPresetSelected(int amount) {
    setState(() {
      _showTextAmount = true;
      _selectedPreset = amount;
      _textAmountOpacity = 1.0;
      _paidAmount += amount;
    });
    _formKey.currentState?.fields["paidAmount"]?.didChange(
        _paidAmountFormatter.formatString((_paidAmount).toString()));

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      setState(() {
        _textAmountOpacity = 0.0; // Fade out the text
      });
    });
  }

  void _onSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderTextField(
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
                      if (_showTextAmount)
                        AnimatedOpacity(
                          opacity: _textAmountOpacity,
                          duration: const Duration(milliseconds: 200),
                          onEnd: () {
                            setState(() {
                              _showTextAmount = false;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: TextBodyS(
                              "Uang sebanyak ${TFormatter.formatToRupiah(_selectedPreset)} telah ditambahkan.",
                              color: TColors.neutralDarkLightest,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 8,
                  children: _presets.map((preset) {
                    return SizedBox(
                      height: 32,
                      child: InputChip(
                        label: TextBodyS(
                          "+ ${TFormatter.formatToRupiah(preset)}",
                        ),
                        selected: false,
                        onPressed: () {
                          _onPresetSelected(preset);
                        },
                      ),
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
