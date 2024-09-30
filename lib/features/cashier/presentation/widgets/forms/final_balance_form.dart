import 'package:cashier_repository/cashier_repository.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

class FinalBalanceForm extends StatefulWidget {
  const FinalBalanceForm({super.key});

  @override
  State<FinalBalanceForm> createState() => _FinalBalanceFormState();
}

class _FinalBalanceFormState extends State<FinalBalanceForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isFormValid = false;

  final CurrencyTextInputFormatter _finalBalance =
      CurrencyTextInputFormatter.currency(
    locale: "id_ID",
    symbol: "Rp",
    decimalDigits: 0,
  );

  Future<void> _onSubmit() async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) {
      SnackBar snackBar = SnackBar(
        content: Text(ErrorTextStrings.formInvalid()),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );
      return;
    }

    dynamic value = _formKey.currentState?.value;

    await context.read<CashierCubit>().closeCashier(
          CloseCashierDto(
            finalBalance: value["finalBalance"],
          ),
        );

    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/cashier",
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          _isFormValid = _formKey.currentState?.isValid ?? false;
          setState(() {});
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: TextHeading2("Masukan saldo akhir kasir"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: FormBuilderTextField(
                    name: "finalBalance",
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.required(
                        errorText: ErrorTextStrings.required()),
                    inputFormatters: [_finalBalance],
                    decoration: const InputDecoration(
                      hintText: 'Rp 0',
                    ),
                    valueTransformer: (value) {
                      return _finalBalance.getUnformattedValue().toInt();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 28.0),
                  child: const TextBodyS(
                    "Masukkan jumlah uang tunai yang ada di laci kasir setelah Anda menyelesaikan shift. Ini akan membantu kami memastikan bahwa semua transaksi telah dicatat dengan benar.",
                    color: TColors.neutralDarkLightest,
                  ),
                ),
                BlocBuilder<CashierCubit, CashierState>(
                  builder: (context, state) {
                    bool enabled =
                        state is! CashierCloseInProgress && _isFormValid;
                    return SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: enabled ? _onSubmit : null,
                        child: const TextActionL(
                          "Lanjutkan",
                          color: TColors.neutralLightLightest,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
