import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/cash/footer.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/cash/form.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/radio_group.dart';
import 'package:point_of_sales_cashier/utils/constants/error_text_strings.dart';

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
      SnackBar snackBar = SnackBar(
        content: Text(ErrorTextStrings.formInvalid()),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );
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
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<PaymentFilterCubit, PaymentFilterState>(
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
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
                CashPaymentForm(
                  formKey: _formKey,
                  amount: widget.amount,
                  onPaidAmountChanged: _onPaidAmountChanged,
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
