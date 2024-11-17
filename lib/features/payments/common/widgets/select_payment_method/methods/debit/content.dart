import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lakoe_pos/features/payments/application/cubit/payment/payment_cubit.dart';
import 'package:lakoe_pos/features/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:lakoe_pos/features/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:lakoe_pos/features/payments/common/widgets/select_payment_method/methods/debit/footer.dart';
import 'package:lakoe_pos/features/payments/common/widgets/select_payment_method/methods/debit/form.dart';
import 'package:lakoe_pos/features/payments/common/widgets/select_payment_method/methods/radio_group.dart';

class DebitPaymentContent extends StatefulWidget {
  const DebitPaymentContent({
    super.key,
    required this.amount,
  });

  final double amount;

  @override
  State<DebitPaymentContent> createState() => DebitPaymentContentState();
}

class DebitPaymentContentState extends State<DebitPaymentContent> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _isFormValid = false;

  void _onSubmitted() {
    FocusScope.of(context).unfocus();

    if (_isFormValid && _formKey.currentState?.saveAndValidate() == true) {
      dynamic value = _formKey.currentState?.value;
      context.read<PaymentCubit>().setDebitCreditPayment(
            accountNumber: "",
            paidAmount: widget.amount,
            approvalCode: value["codeApproval"],
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      onChanged: () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          _isFormValid = _formKey.currentState?.isValid ?? false;
          setState(() {});
        });
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<PaymentFilterCubit, PaymentFilterState>(
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
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
                DebitPaymentForm(onSubmitted: _onSubmitted),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DebitPaymentFooter(
              onCanceled: () {
                Navigator.pop(context);
              },
              onSubmitted: _onSubmitted,
              isFormValid: _isFormValid,
            ),
          ),
        ],
      ),
    );
  }
}
