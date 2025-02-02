import 'package:cashier_repository/cashier_repository.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/error_text_strings.dart';

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

  Future<void> onSubmit() async {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;

    if (!isFormValid) {
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
      "/home",
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
          Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: TextHeading2("Masukan saldo akhir kasir"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: FormBuilderTextField(
                    name: "finalBalance",
                    keyboardType: TextInputType.number,
                    onSubmitted: (value) {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        onSubmit();
                      }
                    },
                    validator: FormBuilderValidators.required(
                        errorText:
                            ErrorTextStrings.required(name: "Saldo Akhir")),
                    inputFormatters: [_finalBalance],
                    decoration: InputDecoration(
                      hintText: 'Rp 0',
                    ),
                    valueTransformer: (value) {
                      return _finalBalance.getUnformattedValue().toInt();
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 28.0),
                  child: TextBodyS(
                    "Masukkan jumlah uang tunai yang ada di laci kasir setelah kamu menyelesaikan shift. Ini akan membantu kami memastikan bahwa semua transaksi telah dicatat dengan benar.",
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
                        onPressed: enabled ? onSubmit : null,
                        child: state is CashierCloseInProgress
                            ? const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  color: TColors.neutralLightLightest,
                                  strokeWidth: 2,
                                ),
                              )
                            : const TextActionL(
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
