import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/separator/separator.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class CashPaymentForm extends StatefulWidget {
  const CashPaymentForm({super.key});

  @override
  State<CashPaymentForm> createState() => _CashPaymentFormState();
}

class _CashPaymentFormState extends State<CashPaymentForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {},
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: FormBuilderTextField(
                    name: "cash",
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      CurrencyTextInputFormatter.currency(
                        locale: "id_ID",
                        symbol: "Rp",
                        decimalDigits: 0,
                      ),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Rp Uang yang diterima',
                      suffixIcon: _formKey.currentState?.fields["case"] != null
                          ? IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.close,
                                size: 22,
                                color: TColors.neutralDarkLightest,
                              ),
                              visualDensity: VisualDensity.compact,
                            )
                          : null,
                    ),
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  children: [
                    InputChip(
                      label: TextBodyS(
                        TFormatter.formatToRupiah(20000),
                      ),
                      onPressed: () {},
                    ),
                    InputChip(
                      label: TextBodyS(
                        TFormatter.formatToRupiah(30000),
                      ),
                      onPressed: () {},
                    ),
                    InputChip(
                      label: TextBodyS(
                        TFormatter.formatToRupiah(50000),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(bottom: 20),
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
                          TextHeading4(TFormatter.formatToRupiah(20000)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextBodyM("Uang yang diterima"),
                          TextHeading4(TFormatter.formatToRupiah(300000)),
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
                        TFormatter.formatToRupiah(10000),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: TextActionL("Selesaikan"),
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
