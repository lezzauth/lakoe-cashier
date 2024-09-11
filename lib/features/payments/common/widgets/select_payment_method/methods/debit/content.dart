import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_cubit.dart';
import 'package:point_of_sales_cashier/features/payments/application/cubit/payment/payment_filter_state.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/debit/footer.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/debit/form.dart';
import 'package:point_of_sales_cashier/features/payments/common/widgets/select_payment_method/methods/radio_group.dart';

class DebitPaymentContent extends StatefulWidget {
  const DebitPaymentContent({
    super.key,
  });

  @override
  State<DebitPaymentContent> createState() => DebitPaymentContentState();
}

class DebitPaymentContentState extends State<DebitPaymentContent> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                  DebitPaymentForm(),
                ],
              ),
            ),
          ),
          DebitPaymentFooter(
            onCanceled: () {
              Navigator.pop(context);
            },
            onSubmitted: () {
              //
            },
          )
        ],
      ),
    );
  }
}
