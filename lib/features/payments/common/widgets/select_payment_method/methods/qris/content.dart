import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/qris/footer.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/qris/form.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/radio_group.dart';

class QrisPaymentContent extends StatefulWidget {
  const QrisPaymentContent({super.key, required this.amount});

  final double amount;

  @override
  State<QrisPaymentContent> createState() => _QrisPaymentContentState();
}

class _QrisPaymentContentState extends State<QrisPaymentContent> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isFormValid = false;
  bool useQRISStatic = false;

  void _onFormChanged(bool isValid) {
    setState(() {
      _isFormValid = isValid;
    });
  }

  void _onSubmitted() {
    if (_isFormValid) {
      context.read<PaymentCubit>().setQRCodePayment(paidAmount: widget.amount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
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
                QrisPaymentForm(
                  onFormChanged: _onFormChanged,
                  useQRISStatic: useQRISStatic,
                  onChanged: (bool? value) {
                    setState(() {
                      useQRISStatic = value ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: QrisPaymentFooter(
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
