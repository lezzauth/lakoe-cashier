import 'dart:async';
import 'dart:developer';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/responsive/responsive_layout.dart';
import 'package:lakoe_pos/common/widgets/ui/separator/separator.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_1.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class CashPaymentForm extends StatefulWidget {
  const CashPaymentForm({
    super.key,
    this.amount = 0,
    required this.formKey,
    required this.onPaidAmountChanged,
    required this.onSubmitted,
  });

  final double amount;
  final GlobalKey<FormBuilderState> formKey;
  final Function(double) onPaidAmountChanged;
  final void Function()? onSubmitted;

  @override
  State<CashPaymentForm> createState() => _CashPaymentFormState();
}

class _CashPaymentFormState extends State<CashPaymentForm> {
  double _paidAmount = 0;

  List<int> _getPreset() {
    if (widget.amount <= 5000) {
      return [1000, 2000, 5000];
    }

    if (widget.amount > 5000 && widget.amount <= 20000) {
      return [5000, 10000, 20000];
    }

    if (widget.amount > 20000 && widget.amount <= 50000) {
      return [20000, 30000, 50000];
    }

    if (widget.amount > 50000 && widget.amount <= 100000) {
      return [50000, 70000, 100000];
    }

    return [100000, 150000, 200000];
  }

  final CurrencyTextInputFormatter _paidAmountFormatter =
      CurrencyTextInputFormatter.currency(
    locale: "id_ID",
    symbol: "Rp",
    decimalDigits: 0,
  );

  double _getPaidAmount() {
    return _paidAmount;
  }

  double _getChange() {
    double change = _getPaidAmount() - widget.amount;
    if (change <= 0) return 0;

    return change;
  }

  bool _showTextAmount = false;
  double _textAmountOpacity = 0.0;
  double _selectedPreset = 0;
  Timer? _debounce;

  void _onPresetSelected(double amount) {
    setState(() {
      _showTextAmount = true;
      _selectedPreset = amount;
      _textAmountOpacity = 1.0;
      _paidAmount += amount;
    });

    log("_onPresetSelected: ${_paidAmountFormatter.formatDouble(_paidAmount).toString()}");

    widget.formKey.currentState?.fields["paidAmount"]
        ?.didChange(_paidAmountFormatter.formatDouble(_paidAmount));

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _textAmountOpacity = 0.0; // Fade out the text
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      onChanged: (value) {
                        setState(() {
                          _paidAmount = _paidAmountFormatter
                              .getUnformattedValue()
                              .toDouble();
                        });
                        widget.onPaidAmountChanged(_paidAmount);
                      },
                      onSubmitted: (value) {
                        if (widget.formKey.currentState?.saveAndValidate() ??
                            false) {
                          widget.onSubmitted!();
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Rp Uang yang diterima',
                        suffixIcon: _paidAmount > 0
                            ? IconButton(
                                onPressed: () {
                                  widget.formKey.currentState!
                                      .fields["paidAmount"]
                                      ?.reset();
                                  setState(() {
                                    _paidAmount = 0;
                                  });
                                  widget.onPaidAmountChanged(0);
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
                children: _getPreset().map((preset) {
                  return SizedBox(
                    height: 32,
                    child: InputChip(
                      label: TextBodyM(
                        "+ ${TFormatter.formatToRupiah(preset)}",
                      ),
                      selected: false,
                      onPressed: () {
                        _onPresetSelected(preset.toDouble());
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
                          TFormatter.formatToRupiah(widget.amount),
                        ),
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
                    ResponsiveLayout(
                      mobile: TextHeading3(
                        TFormatter.formatToRupiah(_getChange()),
                      ),
                      tablet: TextHeading1(
                        TFormatter.formatToRupiah(_getChange()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
