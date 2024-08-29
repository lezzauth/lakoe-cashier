import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/features/home/data/arguments/open_cashier_pin_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class InitialBalanceForm extends StatefulWidget {
  const InitialBalanceForm({super.key});

  @override
  State<InitialBalanceForm> createState() => _InitialBalanceFormState();
}

class _InitialBalanceFormState extends State<InitialBalanceForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  onSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      dynamic value = _formKey.currentState?.value;

      Navigator.popAndPushNamed(context, "/cashier/open-cashier-pin",
          arguments:
              OpenCashierPinArgument(initialBalance: value["initialBalance"]));
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

  final CurrencyTextInputFormatter _currencyFormatter =
      CurrencyTextInputFormatter.currency(
    locale: "id_ID",
    symbol: "Rp",
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextHeading2("Masukan saldo awal"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: FormBuilderField<int>(
                      name: "initialBalance",
                      validator: FormBuilderValidators.required(),
                      builder: (field) {
                        return TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [_currencyFormatter],
                          decoration: InputDecoration(
                            hintText: 'Rp 0',
                            errorText: field.errorText,
                          ),
                          onChanged: (value) {
                            field.didChange(_currencyFormatter
                                .getUnformattedValue()
                                .toInt());
                          },
                        );
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 28.0),
                  child: const TextBodyS(
                    "Saldo awal adalah jumlah uang tunai yang tersedia di laci kasir sebelum memulai transaksi. Pastikan untuk memasukkan jumlah yang akurat.",
                    color: TColors.neutralDarkLightest,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: onSubmit,
                    child: const TextActionL(
                      "Lanjutkan",
                      color: TColors.neutralLightLightest,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
