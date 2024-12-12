import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_cubit.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:lakoe_pos/features/payment_method/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/cash/footer.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/cash/form.dart';
import 'package:lakoe_pos/features/payment_method/payments/common/widgets/select_payment_method/methods/radio_group.dart';

class CashPaymentContent extends StatefulWidget {
  const CashPaymentContent({
    super.key,
    required this.amount,
  });
  final double amount;

  @override
  State<CashPaymentContent> createState() => _CashPaymentContentState();
}

class _CashPaymentContentState extends State<CashPaymentContent> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isFormValid = false;

  void _onSubmitted() {
    bool isFormValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isFormValid) {
      return;
    }

    dynamic value = _formKey.currentState?.value;
    double paidAmount = ((value["paidAmount"] ?? 0) as int).toDouble();

    if (paidAmount < widget.amount) {
      return;
    }

    context.read<PaymentCubit>().setCashPayment(
          paidAmount: paidAmount,
          change: paidAmount - widget.amount,
        );
  }

  void _onPaidAmountChanged(double paidAmount) {
    setState(() {
      _isFormValid = paidAmount >= widget.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // onChanged: _onFormChanged,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<PaymentFilterCubit, PaymentFilterState>(
                  builder: (context, state) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 12.0,
                      ),
                      child: PaymentMethodRadioGroup(
                        value: state.paymentMethod,
                        onChanged: (value) {
                          context
                              .read<PaymentFilterCubit>()
                              .setPaymentMethod(paymentMethod: value!);
                        },
                        limitedValues: const [],
                      ),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 8, 20, 12),
                  child: TextHeading4("Masukan sejumlah uang"),
                ),
                CashPaymentForm(
                  formKey: _formKey,
                  amount: widget.amount,
                  onPaidAmountChanged: _onPaidAmountChanged,
                  onSubmitted: _isFormValid ? _onSubmitted : null,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CashPaymentFooter(
              onCanceled: () {
                Navigator.pop(context);
              },
              onSubmitted: _isFormValid ? _onSubmitted : null,
            ),
          ),
        ],
      ),
    );
  }
}
